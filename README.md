# Project
## Project structure
The following section shows the directory structure of this project. Not all directories and files are tracked by git, but some are referenced by files which are tracked (most often raw-data, processed-data, and results)

├─ 📁[metadata](#metadata)  
├─ 📁[raw-data](#raw-data)  
│ &nbsp; └─ 📁[submodules](#submodules)  
├─ 📁[processed-data](#processed-data)  
├─ 📁[results](#results)  
├─ 📁[scripts](#scripts)  
│ &nbsp; ├─ 📁[functions](#functions)  
│ &nbsp; ├─ 📁[workspace](#workspace)  
│ &nbsp; ├─ 📁[_targets](#targets)  
│ &nbsp; │ &nbsp; └─ 📁[meta](#meta)  
│ &nbsp; │ &nbsp; &nbsp; &nbsp; &nbsp; └─ 📄meta  
│ &nbsp; └─ 📄[_targets.R](#targetsr)  
├─ 📄[_quarto.yml](#_quartoyml)  
├─ 📄[_targets.yml](#_targetsyaml)  
├─ 📄[.gitignore](#_targetsyaml)  
└─ 📄[.gitmodules](#_targetsyaml)  

### [Metatada](#metatada)
The Metadata folder contains information about this project, and is not tracked in git.

### [Raw-data](#raw-data)
The Raw-data folder contains the raw unmodified data which is used to complete the  project, and is not tracked in git.

### [Submodules](#submodules)
The submodules folder contains references or other information which is also tracked via git. This allows tracking the version of the submodules, and the option to update when changes are made to the references. The contents of this folder are not tracked.  See [.gitmodules](#gitmodules)

### [Processed-data](#processed-data)
Processed data contains the processed, modified data which the project produces, that is not clean results. This folder is not tracked in git.
### [Results](#results)

The Results folder contains figures, table images, excel spreadsheets, or other information which is meant to be presented to others. This folder is not tracked in git.
### [Scripts](#scripts)

The scripts folder contains scripts used in completing the analysis. Most files here are tracked in git.
### [Functions](#functions)
The functions folder contains contains scripts to load functions, most often used by _targets.R in workflow management. 

### [Workspace](#workspace)
The workspace folder contains descriptive code documents. It is most often used as scratch space for tracking stream-of-flow analysis, usually quarto documents. Files in here can created and deleted as they go out of date, and is primarily used as a tool to experiment with anlaysis that isn't settled enough to integrate into targets, or in generating figures / visual reports.

### [_targets](#_targets)
The _targets folder contains information about the targets pipeline. It is mostly untracked, with the exception of the ./_targets/meta/meta file.

### [meta](#meta)
The meta folder is mostly untracked. The meta/meta file hashes functions, inputs, and outputs of the targets pipeline, and is good for tracking how untracked objects change over time. 

### [_targets.R](#_targetsr)
The _targets.R file orchestrates the targets workflow management. It is meant to store relatively static and computationally expensive parts of the analysis, making it easier to change parts of the pipeline and only have to rerun the parts that are changed. 

### [_quarto.yml](#_quartoyml)
The _quarto.yml file manages quarto document execution, so that all quarto documents will execute from the root directory (so all relative paths are consistent). It also manages the output, so that all quarto knit documents are output in the untracked ./results/ folder instead of the tracked ./scripts/ folder. 

### [_targets.yaml](#_targetsyaml)
The _targets.yml file manages targets workflow execution, describing where the workflow description is, and where the functions are that targets needs to execute the workflow.

### [.gitignore](#gitignore)
Gitignore controls which files are available and which files are not. 

### [.gitmodules](#gitmodules)
.gitmodules tracks the names of the submodules within this project, and their versions. As the submodules are updated, the .gitmodules document is updated. As such, this file should be tracked so the version of the reference is clear.
