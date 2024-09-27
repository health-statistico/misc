import pyreadstat
import pandas as pd
import tkinter as tk
from tkinter import filedialog
from tkinter import messagebox

def choose_file(file_type):
    """Open a file dialog to select the input file."""
    file_path = filedialog.askopenfilename(title=f"Select the {file_type} File", filetypes=[(f"{file_type} files", f"*.{file_type.lower()}")])
    return file_path

def convert_dta_to_csv(input_file, output_file):
    """Convert Stata .dta file to .csv."""
    try:
        # Read the .dta file
        df, meta = pyreadstat.read_dta(input_file)
        
        # Write the DataFrame to a .csv file
        df.to_csv(output_file, index=False)
        messagebox.showinfo("Success", f"Successfully converted {input_file} to {output_file}")
    except Exception as e:
        messagebox.showerror("Error", f"Failed to convert file: {e}")

def main():
    """Main function to run the conversion process."""
    # Create a simple GUI window
    root = tk.Tk()
    root.withdraw()  # Hide the root window

    # Choose the input .dta file
    input_file = choose_file('DTA')
    if not input_file:
        messagebox.showwarning("Warning", "No input file selected. Exiting.")
        return
    
    # Choose the output .csv file location
    output_file = filedialog.asksaveasfilename(title="Save CSV As", defaultextension=".csv", filetypes=[("CSV files", "*.csv")])
    if not output_file:
        messagebox.showwarning("Warning", "No output file selected. Exiting.")
        return
    
    # Convert the file
    convert_dta_to_csv(input_file, output_file)

if __name__ == "__main__":
    main()
