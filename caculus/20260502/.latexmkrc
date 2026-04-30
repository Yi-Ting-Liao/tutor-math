# Latexmk configuration file
# Use XeLaTeX for compilation

$pdf_mode = 5;                    # Generate PDF via xelatex
$xelatex = 'xelatex -interaction=nonstopmode -file-line-error %O %S';

# Run cleanup after successful PDF generation
$success_cmd = 'latexmk -c %R';
