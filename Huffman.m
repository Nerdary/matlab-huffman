%传入参数P为每个元素出现次数序列
%返回值a中是按字符出现次数升序排列的huffman编码表

%作者：陈麒先
%时间：2018-12-13 11:55
%联系我：chenqixian@buaa.edu.cn

function [a]=Huffman(P)
P=sort(P); % 对传入序列进行排序（升序）
A=P; % A 为初始序列
B=[];
i=1;  % i为Huffman数的层数（自底向上构造）
LL=length(P); %LL为序列总长度（即不同字母个数）
L=LL; % L为当前序列长度
B(1,:)= P; % B 也为初始序列，之后B矩阵存放Huffman树
while(L>2)  % 该循环为Huffman树的计算过程
      i=i+1; 
      B(i,1)=A(1)+A(2);  %选排序最小的两个节点相加
      for j=2:(L-1)
         B(i,j)=A(j+1);  % 利用循环将剩下的节点值顺序移动
      end
      L=L-1;  % 更新剩余节点总长度
      B(i,1:L)=sort(B(i,1:L)); % 对当前层进行排序
      A=B(i,1:L); % 更新A数组用于下次循环计算
end

for ll=1:i  % 初始化huffman编码矩阵 
    for n=1:LL
        W(ll,n)={'0'}; % 采用cell结构里面含有字符串，为每一个节点的初始编码置0
    end
end
W(i,1)={'1'}; %根节点左子节点为1
 
for m=(i-1):-1:1 % 从上往下遍历（递归下降^_^）
     BB=B(m,1)+B(m,2); % 计算该层前两个节点（数值最小两个）的和到BB
     BBB=find(B(m+1,:)==BB); % 在上一层中找到该节点
     BBB=BBB(1);  % 获取这两个节点父节点的列坐标
     
        W(m,1:2)=W(m+1,BBB); % 该层前两个节点复制其父节点的信息 
        W(m,1)=strcat(W(m,1),'1'); % 左子结点连‘1’（较小节点）
        W(m,2)=strcat(W(m,2),'0'); % 右子结点连‘0’
        uu=zeros(1,LL);
        uu(1)=BBB;
        y=1;
        
         for n=3:(LL+1-m)    % 处理除了前两个节点剩下的节点
              fd3=find(B(m,n)==B(m+1,:)); % 在上一层中找到与当前处理节点值相等的节点索引记录到fd3中
              % 处理上一层有冲突的情况（一个值对应多个节点，即fd3中有多个元素的取值）
              for pp=1:length(fd3)
                  kk=isempty(find(uu==fd3(pp)));
                 if(kk==1)
                     y=y+1;                   
                     fd3=fd3(pp);
                     uu(y)=fd3;
                     break;
                 end
              end
             % bug fix
              W(m,n)=W(m+1,fd3); % 将上一层中找到与该节点值相等的huffman码值复制下来
         end
end
a=W(1,:);

end
