%���������ű��ļ���
%ʵ�ֶ��ļ���ͳ���ַ�������huffman���뺯���ļ�������ԭ�ı���huffman����

%���ߣ�������
%ʱ�䣺2018-12-13 11:55
%��ϵ�ң�chenqixian@buaa.edu.cn

clear
[text] = textread('test.txt','%[^\n]');  %���ļ�
str = char(text);
s = '';
ls = size(str); 
linenum = ls(1);  %������
for i = 1 : linenum           % �ļ��ַ�����ʽ����
    s = strcat(s , str(i,:));
end

b=unique(s);%�����ж��ٸ����ظ����ַ���
for i=1:length(b)
num(i)=length(strfind(s,b(i))); %ͳ���ַ�����Ŀ
end

b; %��ʾ�ַ�
num; %��ʾ����
for i = 1 : length(b)       % ����һ���ṹ����
   map(i).ch = b(i);        % ÿ���ṹ���¼�ַ�ֵ�ͳ��ִ���
   map(i).num = num(i);     
end

[num_sorted , id] = sort([map.num]);  %���ճ��ִ������ṹ���������������±갴�������id��
huffman_result = Huffman(num);
str_result = char(huffman_result);   %��Ҫ��Ϊ����Huffman��������Ľ���������Ӧ�����ַ����ִ�������
output = '';            %��ʼ��������
for i = 1:length(s)     % s Ϊ��¼�˴�Դ�ļ��ж�������ȫ���ַ�
    idx = find(b == s(1,i));  % �ҵ�����ĸ����ĸ��b�е��±�
    index = find(id == idx);  % ���±�idx�ҵ����ڽṹ������������id�е��±꣨������ĸ���ִ������е�˳��ڼ�����
    output = strcat(output , str_result(index , :));  % ��huffman��������ƴ���ַ���
end

fid = fopen('HuffmanCode.txt','w');
fprintf(fid, '%s\n', output);
fclose(fid);