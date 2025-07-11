# Code made by: Olaiyan Alolaiyan - Anantram Group - University of Washington 
# Load the molecule
puts "Loading moldnaecule..."
set mol [mol new cXXX.pdb waitfor all]  ;# <-- Update with the name of your file
puts "Loaded molecule."

# Define the selection for the molecule
set sel_molecule [atomselect $mol "all"]

# Define the number of frames
set num_frames [molinfo $mol get numframes]

# Open output file for the molecule
set out_molecule [open "rmsd_cXXX.dat" w]

# Function to calculate RMSD frame by frame with alignment
proc calc_rmsd { ref_frame mol sel out_file } {
    global num_frames

    # Set reference frame for the molecule based on the passed ref_frame argument
    set ref_sel [atomselect $mol "all" frame $ref_frame]

    # Iterate over all frames with a step of 1
    for {set i 0} {$i < $num_frames} {incr i 1} {
        $sel frame $i   ;# <-- Set the frame for the selection first
        
        # Align the current frame to the reference frame
        set transformation [measure fit $sel $ref_sel]
        $sel move $transformation
        
        # Compute RMSD for aligned molecule
        set rmsd_val [measure rmsd $sel $ref_sel]
        puts $out_file "$ref_frame $i $rmsd_val"
    }

    $ref_sel delete
}

# Calculate RMSD for all frames using every 10th frame as a reference
for {set ref 0} {$ref < $num_frames} {incr ref 1} {
    puts "Calculating RMSD using frame $ref as the reference."
    calc_rmsd $ref $mol $sel_molecule $out_molecule
}

# Close the output file for the molecule
close $out_molecule

# Exit VMD
exit
