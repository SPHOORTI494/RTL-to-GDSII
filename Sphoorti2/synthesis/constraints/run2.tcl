
check_design

############################################################
# Read Constraints
############################################################

read_sdc ./constraints/counter8bit.sdc

############################################################
# Compile
############################################################

compile_ultra

############################################################
# Create output directories
############################################################

file mkdir synthesis/results
file mkdir synthesis/reports

############################################################
# Outputs
############################################################

write -format verilog \
-hierarchy \
-output synthesis/results/counter8bit_syn.v

write -format ddc \
-hierarchy \
-output synthesis/results/counter8bit.ddc

write_sdf synthesis/results/counter8bit.sdf

write_sdc -nosplit synthesis/results/counter8bit_out.sdc

############################################################
# Reports
############################################################

report_area > synthesis/reports/area.rpt

report_power > synthesis/reports/power.rpt

report_timing > synthesis/reports/timing.rpt

report_qor > synthesis/reports/qor.rpt

report_constraint -all_violators > synthesis/reports/constraint.rpt

exit
