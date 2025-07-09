# Code made by: Olaiyan Alolaiyan - Anantram Group - University of Washington 
# Load the molecule - make sure file name match yours
mol new cXXX.pdb waitfor all

# Select alignment region: "all"
set align_sel [atomselect top "all"]

# Select RMSF calculation region
set rmsf_sel [atomselect top "all"]

# Number of frames
set num_frames [molinfo top get numframes]

# Align all frames to reference frame 0
for {set frame 0} {$frame < $num_frames} {incr frame} {
    $align_sel frame $frame
    set trans_matrix [measure fit $align_sel [atomselect top "all" frame 0]]
    $rmsf_sel frame $frame
    $rmsf_sel move $trans_matrix
}

# Compute RMSF after alignment - update output name
set fp [open "rmsf_cXXX.dat" w]
set rmsf_values [measure rmsf $rmsf_sel first 0 last [expr {$num_frames - 1}] step 1]

# Write RMSF values to file
for {set i 0} {$i < [$rmsf_sel num]} {incr i} {
    puts $fp "[expr {$i+1}] [lindex $rmsf_values $i]"
}
close $fp

puts "RMSF values saved"
exit

