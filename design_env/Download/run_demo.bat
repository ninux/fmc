echo ----- Update Bistream with bootloop
data2mem -bm "file\system_bd" -p xc6slx150tfgg676-3 -bt "file\system.bit" -bd "file\bootloop.elf" tag microblaze_0 -o b file\download.bit 
echo ----- Loading FPGA Design
impact -batch download.cmd
echo ----- Loading Software Application
xmd

pause