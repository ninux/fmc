% This script can be used to convert data for one MIDI channel perpared in csv
% format into a .mif file for ROM initialization.
% NOTE: The CR at the end of the last line in the generated .mif file
%       must be removed manually!!
%
% .csv format: col_1        col_2
%              tone_number  absolute time         
% .mif format: 
%         Bit: 19   ...    6 5   ...   0
%              tone_duration tone_number
%                   [ms]     [MIDI key #]

% set number of fmc channels
NOF = 8;

for fmc_ch = 0:(NOF-1)
    % generate filename
    filename = ['Pirate_ch'  num2str(fmc_ch) '.csv'];
    % read in csv file for Channel
    csv = dlmread(filename);
    % format csv data for .mif file generation
    mif = zeros(size(csv,1),1);
    for i=1:size(csv,1)-1
        mif(i)= (csv(i+1,2)-csv(i,2))*(2^6) + csv(i,1);
    end
    % add EOF in last row of mif.file
    mif(size(csv,1)) = 2^20-1;
    % write .mif file in binary format
    dest_filename = ['fmc_rom_'  num2str(fmc_ch) '.mif'];
	% note: command table is only available in Matlab 2013 and above
    write(table(dec2bin(mif,20)), dest_filename, 'FileType', 'text', 'WriteVariableNames', false);
end