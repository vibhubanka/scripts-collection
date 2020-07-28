# Scripts

## Descriptions

#### [zipDiff.sh](/zipDiff.sh)
Creates a zip file by comparing the your git project's origin/master and provided commit ID. The created zip file keeps the folder structure intact.

Use Case: In a project, when there is lack of a common git repository between teams, it makes code sharing a tedious job. This script makes an attempt to solve this problem by allowing collaborators to share only the modified files in zip format.

## Usage

For using the script as a CLI tool. Add the below line to your `.bashrc` (add it to `.zshrc` if you are using ZSH)

```bash
alias custom_command="bash <(curl -s https://raw.githubusercontent.com/vibhubanka/scripts-collection/master/script_name.sh)"
```

After adding alias, reload the rc file using source.
```bash
source path/to/rc_file
```

Go the git project where you want to execute the script.
```bash
cd ~/path/to/project
```

Test if it works fine or not!
```bash
custom_command
```

**Example:**
```bash
echo "alias zipd=\"bash <(curl -s https://raw.githubusercontent.com/vibhubanka/scripts-collection/master/zipDiff.sh)\"" >> ~/.bashrc
source ~/.bashrc
cd ~/projects/my-project
zipd myZipFileName.zip
```
