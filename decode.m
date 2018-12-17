% input:    huffman code and the matrix prodiced by Huffman.m
%           original_chars is an array of sorted original charactors
% output:   the original content of huffman code

% 2018/12/17 Zehui Jin

function [content] = decode(huffman_result, huffman_code, original_chars)
    
    content = '';
    token = '';
    Length = length(huffman_code);
    Count = length(huffman_result);
    for i=1:Length
        char = huffman_code(i);         % read next number
        token = strcat(token, char);    % strcat
        for j=1:Count
            result = strcmp(token, huffman_result(j));
            if(result==1)
                content = strcat(content, original_chars(j));
                token = '';             % clear token
            end
        end
    end
        
end
