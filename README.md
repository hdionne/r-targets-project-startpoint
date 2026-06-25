# Project
## Project structure
The following section shows the directory structure of this project. Not all directories and files are tracked by git, but some are referenced by files which are tracked (most often raw-data, processed-data, and results)
```
├─ metadata
├─ raw-data
├─ processed-data
├─ results
├─ scripts
│  ├─ functions
│  ├─ workspace
│  ├─ _targets
│  │  └─ meta
│  │     └─ meta
│  └─ _targets.R
├─ _quarto.yml
└─ _targets.yml
```

### Metatada
The Metadata folder contains information about this project, and is not tracked in git.
### Raw-data
The Raw-data folder contains the raw unmodified data which is used to complete the  project, and is not tracked in git.
### Processed-data
Processed data contains the processed, modified data which the project produces, that is not clean results. This folder is not tracked in git.
### Results
The Results folder contains figures, table images, excel spreadsheets, or other information which is meant to be presented to others. This folder is not tracked in git.
### Scripts
The scripts folder contains scripts used in completing the analysis. Most files here are tracked in git.
### Functions
The functions folder contains contains scripts to load functions, most often used by _targets.R in workflow management. 
### Workspace
The workspace folder contains descriptive code documents. It is most often used as scratch space for tracking stream-of-flow analysis, usually quarto documents. Files in here can created and deleted as they go out of date, and is primarily used as a tool to experiment with anlaysis that isn't settled enough to integrate into targets, or in generating figures / visual reports.
### _targets
The _targets folder contains information about the targets pipeline. It is mostly untracked, with the exception of the ./_targets/meta/meta file, ### meta
The meta folder is mostly untracked. The meta/meta file hashes functions, inputs, and outputs of the targets pipeline, and is good for tracking how untracked objects change over time. 

### _targets.R
The _targets.R file orchestrates the targets workflow management. It is meant to store relatively static and computationally expensive parts of the analysis, making it easier to change parts of the pipeline and only have to rerun the parts that are changed. 

### _quarto.yml
The _quarto.yml file manages quarto document execution, so that all quarto documents will execute from the root directory (so all relative paths are consistent). It also manages the output, so that all quarto knit documents are output in the untracked ./results/ folder instead of the tracked ./scripts/ folder. 

### _targets.yaml
The _targets.yml file manages targets workflow execution, describing where the workflow description is, and where the functions are that targets needs to execute the workflow.

### .gitignore and .gitmodules
Gitignore controls which files are available and which files are not. 
.gitmodules allows importing git projects from other repositories. Some repositories are used to store data to reference. 
In the case of referencing data, it should be stored in the raw-data folder, so as not to be tracked by this project. Any project-specific changes should be placed in processed data, so that no data in raw-data is ever changed.