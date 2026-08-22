#!/usr/bin/env python
# coding: utf-8

# In[24]:


import pandas as pd


# In[2]:


file_path = 'hospital_bartially (1).xlsx'
xls = pd.ExcelFile(r"C:\Users\FORMAT\OneDrive\المستندات\hospital_bartially.xlsx")
xls



# In[3]:


df_doctors = pd.read_excel(xls, 'Sheet2')
df_patients = pd.read_excel(xls, 'Sheet3')
df_treatment_records = pd.read_excel(xls, 'Sheet4')
df_treatments = pd.read_excel(xls, 'Sheet5')


# In[17]:


df_patients['full_name'] = df_patients['full_name'].str.strip().str.title()
df_patients


# In[5]:


df_patients['phone'] = df_patients['phone'].fillna('Unknown')
df_patients['phone'] = df_patients['phone'].apply(
    lambda x: f"0{int(x)}" if isinstance(x, (int, float)) and not pd.isna(x) and x != 'Unknown' else str(x)
)

df_patients['phone']


# In[6]:


df_patients['dob'] = pd.to_datetime(
    df_patients['dob'], format='mixed', dayfirst=True
).dt.strftime('%Y-%m-%d')
df_patients


# In[7]:


df_patients = df_patients.drop_duplicates(subset=['full_name', 'dob'], keep='first')
df_patients



# In[8]:


df_treatment_records['treatment_date'] = pd.to_datetime(
    df_treatment_records['treatment_date'], format='mixed'
).dt.strftime('%Y-%m-%d') 
df_treatment_records


# In[19]:


for col in ['full_name', 'specialty', 'gender']:
    df_doctors[col] = df_doctors[col].astype(str).str.strip()

df_doctors



# In[20]:


df_treatments['treatment_name'] = df_treatments['treatment_name'].astype(str).str.strip()
df_treatments


# In[11]:


with pd.ExcelWriter('hospital_cleaned.xlsx', engine='openpyxl') as writer:
    df_doctors.to_excel(writer, sheet_name='Doctors', index=False)
    df_patients.to_excel(writer, sheet_name='Patients', index=False)
    df_treatment_records.to_excel(writer, sheet_name='Treatment_Records', index=False)
    df_treatments.to_excel(writer, sheet_name='Treatments', index=False)



# In[12]:


print("تم تنظيف البيانات وحفظها بنجاح في ملف 'hospital_cleaned.xlsx'")


# In[ ]:





# In[21]:


output_file = "hospital_cleaned.xlsx"

with pd.ExcelWriter(output_file, engine="openpyxl") as writer:
    df_doctors.to_excel(writer, sheet_name="Doctors", index=False)
    df_patients.to_excel(writer, sheet_name="Patients", index=False)
    df_treatment_records.to_excel(
        writer, sheet_name="Treatment_Records", index=False
    )
    df_treatments.to_excel(writer, sheet_name="Treatments", index=False)



# In[23]:


import os
print(os.getcwd())


# In[ ]:




