%主函数（脚本文件）
%实现读文件，统计字符，调用huffman编码函数文件，生成原文本的huffman编码

%作者：陈麒先
%时间：2018-12-13 11:55
%联系我：chenqixian@buaa.edu.cn

clear
[text] = textread('test.txt','%[^\n]');  %读文件
str = char(text);
s = '';
ls = size(str); 
linenum = ls(1);  %总行数
for i = 1 : linenum           % 文件字符串格式处理
    s = strcat(s , str(i,:));
end

b=unique(s);%计算有多少个不重复的字符串
for i=1:length(b)
num(i)=length(strfind(s,b(i))); %统计字符的数目
end

b; %显示字符
num; %显示个数
for i = 1 : length(b)       % 建立一个结构数组
   map(i).ch = b(i);        % 每个结构体记录字符值和出现次数
   map(i).num = num(i);     
end

[num_sorted , id] = sort([map.num]);  %按照出现次数将结构数组排序，排序后的下标按升序存入id中
huffman_result = Huffman(num);
str_result = char(huffman_result);   %主要是为了与Huffman计算出来的结果排序相对应（按字符出现次数升序）
output = '';            %初始化输出结果
for i = 1:length(s)     % s 为记录了从源文件中读出来的全部字符
    idx = find(b == s(1,i));  % 找到该字母在字母表b中的下标
    index = find(id == idx);  % 用下标idx找到其在结构体排序索引表id中的下标（即按字母出现次数排列的顺序第几个）
    output = strcat(output , str_result(index , :));  % 从huffman编码结果中拼接字符串
end

fid = fopen('HuffmanCode.txt','w');
fprintf(fid, '%s\n', output);
fclose(fid);