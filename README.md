# scRNAseq-Pipeline
Demonstrate analysis of scRNAseq data, such as from 10X Genomics, from fetching data to raw data processing to finding unique information between cell types to lead to biologically relevant insights. Here I will show an example pipeline with scRNAseq data from the tumor microenvironment of human pancreatic adenocarcinoma (Werba et. al., 2023). 

### Data Availability
All data available on GEO under GSE205013.

### References
Werba, G., Weissinger, D., Kawaler, E.A. et al. Single-cell RNA sequencing reveals the effects of chemotherapy on human pancreatic adenocarcinoma and its tumor microenvironment. Nat Commun 14, 797 (2023). https://doi.org/10.1038/s41467-023-36296-4

## Tools
- SRA-Toolkit: 3.4.1
- FastQC: 0.12.1
- MultiQC: 1.34
- CellRanger: 10.1.0 (Linux system required for CellRanger)
- Bash: 3.2.57
- R: 4.5.2

## License

This project is license under the MIT License - see the details below:

MIT License

Copyright (c) 2026 Catherine Wu

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to do so, subject to the
following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
