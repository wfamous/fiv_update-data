# New to python ? 🐍

Here are the first steps you need to follow if you want to use python in your environment.

## Install Python3 (Debian) ⚡

**Update your package list** : 
```bash
sudo apt update
```

**Install Python3 and its package manager** : 
```bash
sudo apt install python3 python3-pip
```

**Verify its installation** : 
```bash
python3 --version
pip3 --version
```

## Create your environment 🖥️

To run your scripts, you need to activate a virtual Python3 environment. We called our environment folder "venv" and placed it at the root of our project. You can create your own environment folder at the root of your project by running this command :

format => python3 -m venv path/to/<python_env_name>.

```bash
python3 -m venv venv
```

Then activate it :

format => source <python_env_name>/bin/activate

```bash
source venv/bin/activate
```