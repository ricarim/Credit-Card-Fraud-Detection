# Credit Card Fraud Detection 

## Setup Instructions

To set up the Python environment for this project, follow these steps:

1. **Create a Virtual Environment**:
   In your terminal, run the following command to create a virtual environment:
   ```bash
   python -m venv venv
   ```

2. **Activate the Virtual Environment**:

   - On **macOS/Linux**:
     ```bash
     source venv/bin/activate
     ```
   - On **Windows**:
     ```bash
     venv\Scripts\activate
     ```
3. **Install Dependencies**:
   Once the virtual environment is activated, install the necessary dependencies listed in `requirements.txt`:
   ```bash
   pip install -r requirements.txt


## Convert notebook to pdf

```bash 
jupyter nbconvert --execute --to pdf report.ipynb
```