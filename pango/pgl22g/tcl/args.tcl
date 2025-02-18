set top %top%
set generate_timng_report "true"
# set generate_timng_report ""
set long_name %long_name%
set fpga_dir %fpga_dir%
set vsrc_mem %vsrc_mem%
set constraints %constraints%
set ipcores %ipcores%

set project_name $top

set top_file ${long_name}.top.v
set top_sim_file no_file.v
set source_files [list \
  ${fpga_dir}/common/vsrc/$vsrc_mem \
  ${fpga_dir}/common/vsrc/mem_split.v \
  ${fpga_dir}/common/vsrc/PowerOnResetFPGAOnly.v]

# define FPGA Chip
# set device PGL22G-6MBG324
set family    Logos
set device    PGL22G
set package   MBG324
set speed     -6
set_arch      -family $family -device $device -speedgrade $speed -package $package
set device_name pgl22g

set jobs 20

# define the output directory area
set   project_dir [file normalize .]
