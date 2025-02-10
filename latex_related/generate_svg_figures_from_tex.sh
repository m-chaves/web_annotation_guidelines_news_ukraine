# This script compiles all .tex files in the CURRENT directory to svg format
# To run it use ./generate_svg_figures_from_tex.sh

# Check if dvisvgm is installed
if ! command -v dvisvgm &> /dev/null
then
    echo "dvisvgm could not be found. Please install it first."
    exit 1
fi

# Loop through all .tex files in the current directory
for tex_file in *.tex; do
    # Compile the .tex file to DVI
    latex "$tex_file"

    # Get the base name (without extension) of the file
    base_name="${tex_file%.tex}"

    # Convert the .dvi file to .svg
    dvisvgm "$base_name.dvi" -o "$base_name.svg"

    # Optionally, clean up the .dvi and .log files
    rm "$base_name.dvi" "$base_name.log"

    echo "Converted $tex_file to $base_name.svg"
done