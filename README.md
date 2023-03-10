# Apache Iceberg Lab with Spark on GCP powered by Dataproc Serverless

## A) Lab introduction

### A1. Iceberg in a nutshell
Apache Iceberg is an open standard table format for huge analytic tables that can be used by multiple processing engines and brings in schema evolution, hidden partitioning, time travel and version rollback and ACID compatibility to Datalakes. Learn more at [Apache Iceberg](https://iceberg.apache.org/)

### A2. About the lab
<br>

#### Summary
This lab exercise which runs Apache Spark on Cloud Dataproc aims to familiarize users to Apache Iceberg with a minimum viable sample of the core features of the table format on a Data Lake on Cloud Storage. The dataset leveraged is the Kaggle Lending Club loan dataset, and the lab features a set of eight Spark notebooks, each covering a feature or a set of features. The lab is fully scripted (no challenges) and is for pure instructional purpose.

#### Automation
The lab includes Terraform automation for GCP environment provisioning and detailed instructions including commands and configuration.

#### Features Covered
Apache Iceberg Features covered in Spark notebooks:

| # | Feature/Step | Notebook |
| -- | :--- | :--- |
| 1. | Create curated Parquet table off of CSV files in the data lake backed by Cloud Storage | IcebergLab-1.ipynb |
| 2. | a) Introduce Hadoop and Hive Catalogs for Iceberg<br>b) Create partitioned and unpartitioned Iceberg tables<br>c) Explore folder structure of tables in datalake| IcebergLab-2.ipynb  |
| 3. | Explore CRUD operations  | IcebergLab-3.ipynb  |
| 4. | a) Schema Enforcement<br> b) Schema Evolution | IcebergLab-4.ipynb  |
| 5. | Explore Metadata Inspection Tables provided by Iceberg | IcebergLab-5.ipynb  |
| 6. | Explore Time travel  | IcebergLab-6.ipynb  |
| 7. | Learn  Table Snapshot Management | IcebergLab-7.ipynb  |
| 8. | Learn Table Maintenance Procedures| IcebergLab-8.ipynb  |


### A3. Key products used in the lab

1. Cloud Storage - as data lake + storage for raw data & notebook, storage for Dataproc - temp bucket and staging bucket
2. Vertex AI Workbench - managed (Jupyter) notebooks
3. Dataproc Serverless Spark interactive - interactive Spark infrastructure fronted by Vertex AI managed notebooks

### A4. Technology & Libraries
1. Distributed computing engine -  Apache Spark version 3.3.1<br>(Dataproc Serverless Spark version 2.0.10)
2. Flavor of Spark: PySpark
3. Table format - Apache Iceberg (iceberg-spark-runtime-3.3_2.13:1.1.0)

### A5. Lab Architecture

Note: Due to storage limits in git, we have created parquet files that are a subset of the original CSV files. <br>

About Dataproc Serverless Spark Interactive:<br>
Fully managed, autoscalable, secure Spark infrastructure as a service for use with Jupyter notebooks on Vertex AI Workbench managed notebooks. Use as an interactive Spark IDE, for accelerating development and speed to production.


### A6. Lab Dataset

##### Dataset
Kaggle Lending Club public dataset

##### Rows
740,121

##### Raw Data Schema
```
root
 |-- id: string (nullable = true)
 |-- member_id: string (nullable = true)
 |-- loan_amnt: float (nullable = true)
 |-- funded_amnt: integer (nullable = true)
 |-- funded_amnt_inv: double (nullable = true)
 |-- term: string (nullable = true)
 |-- int_rate: string (nullable = true)
 |-- installment: double (nullable = true)
 |-- grade: string (nullable = true)
 |-- sub_grade: string (nullable = true)
 |-- emp_title: string (nullable = true)
 |-- emp_length: string (nullable = true)
 |-- home_ownership: string (nullable = true)
 |-- annual_inc: float (nullable = true)
 |-- verification_status: string (nullable = true)
 |-- loan_status: string (nullable = true)
 |-- pymnt_plan: string (nullable = true)
 |-- url: string (nullable = true)
 |-- desc: string (nullable = true)
 |-- purpose: string (nullable = true)
 |-- title: string (nullable = true)
 |-- zip_code: string (nullable = true)
 |-- addr_state: string (nullable = true)
 |-- dti: float (nullable = true)
 |-- delinq_2yrs: float (nullable = true)
 |-- earliest_cr_line: string (nullable = true)
 |-- inq_last_6mths: string (nullable = true)
 |-- mths_since_last_delinq: integer (nullable = true)
 |-- mths_since_last_record: string (nullable = true)
 |-- open_acc: integer (nullable = true)
 |-- pub_rec: integer (nullable = true)
 |-- revol_bal: integer (nullable = true)
 |-- revol_util: string (nullable = true)
 |-- total_acc: float (nullable = true)
 |-- initial_list_status: string (nullable = true)
 |-- out_prncp: string (nullable = true)
 |-- out_prncp_inv: double (nullable = true)
 |-- total_pymnt: string (nullable = true)
 |-- total_pymnt_inv: double (nullable = true)
 |-- total_rec_prncp: double (nullable = true)
 |-- total_rec_int: double (nullable = true)
 |-- total_rec_late_fee: double (nullable = true)
 |-- recoveries: double (nullable = true)
 |-- collection_recovery_fee: double (nullable = true)
 |-- last_pymnt_d: string (nullable = true)
 |-- last_pymnt_amnt: string (nullable = true)
 |-- next_pymnt_d: string (nullable = true)
 |-- last_credit_pull_d: string (nullable = true)
 |-- collections_12_mths_ex_med: string (nullable = true)
 |-- mths_since_last_major_derog: string (nullable = true)
 |-- policy_code: string (nullable = true)
 |-- application_type: string (nullable = true)
 |-- annual_inc_joint: string (nullable = true)
 |-- dti_joint: double (nullable = true)
 |-- verification_status_joint: string (nullable = true)
 |-- acc_now_delinq: integer (nullable = true)
 |-- tot_coll_amt: integer (nullable = true)
 |-- tot_cur_bal: integer (nullable = true)
 |-- open_acc_6m: integer (nullable = true)
 |-- open_il_6m: integer (nullable = true)
 |-- open_il_12m: integer (nullable = true)
 |-- open_il_24m: integer (nullable = true)
 |-- mths_since_rcnt_il: integer (nullable = true)
 |-- total_bal_il: integer (nullable = true)
 |-- il_util: integer (nullable = true)
 |-- open_rv_12m: integer (nullable = true)
 |-- open_rv_24m: integer (nullable = true)
 |-- max_bal_bc: integer (nullable = true)
 |-- all_util: integer (nullable = true)
 |-- total_rev_hi_lim: integer (nullable = true)
 |-- inq_fi: integer (nullable = true)
 |-- total_cu_tl: integer (nullable = true)
 |-- inq_last_12m: integer (nullable = true)
 |-- acc_open_past_24mths: integer (nullable = true)
 |-- avg_cur_bal: integer (nullable = true)
 |-- bc_open_to_buy: integer (nullable = true)
 |-- bc_util: double (nullable = true)
 |-- chargeoff_within_12_mths: double (nullable = true)
 |-- delinq_amnt: integer (nullable = true)
 |-- mo_sin_old_il_acct: double (nullable = true)
 |-- mo_sin_old_rev_tl_op: integer (nullable = true)
 |-- mo_sin_rcnt_rev_tl_op: integer (nullable = true)
 |-- mo_sin_rcnt_tl: integer (nullable = true)
 |-- mort_acc: integer (nullable = true)
 |-- mths_since_recent_bc: integer (nullable = true)
 |-- mths_since_recent_bc_dlq: integer (nullable = true)
 |-- mths_since_recent_inq: integer (nullable = true)
 |-- mths_since_recent_revol_delinq: integer (nullable = true)
 |-- num_accts_ever_120_pd: integer (nullable = true)
 |-- num_actv_bc_tl: integer (nullable = true)
 |-- num_actv_rev_tl: integer (nullable = true)
 |-- num_bc_sats: integer (nullable = true)
 |-- num_bc_tl: integer (nullable = true)
 |-- num_il_tl: integer (nullable = true)
 |-- num_op_rev_tl: integer (nullable = true)
 |-- num_rev_accts: integer (nullable = true)
 |-- num_rev_tl_bal_gt_0: integer (nullable = true)
 |-- num_sats: integer (nullable = true)
 |-- num_tl_120dpd_2m: integer (nullable = true)
 |-- num_tl_30dpd: integer (nullable = true)
 |-- num_tl_90g_dpd_24m: integer (nullable = true)
 |-- num_tl_op_past_12m: integer (nullable = true)
 |-- pct_tl_nvr_dlq: double (nullable = true)
 |-- percent_bc_gt_75: double (nullable = true)
 |-- pub_rec_bankruptcies: integer (nullable = true)
 |-- tax_liens: integer (nullable = true)
 |-- tot_hi_cred_lim: integer (nullable = true)
 |-- total_bal_ex_mort: integer (nullable = true)
 |-- total_bc_limit: integer (nullable = true)
 |-- total_il_high_credit_limit: integer (nullable = true)
 |-- revol_bal_joint: integer (nullable = true)
 |-- sec_app_earliest_cr_line: string (nullable = true)
 |-- sec_app_inq_last_6mths: integer (nullable = true)
 |-- sec_app_mort_acc: integer (nullable = true)
 |-- sec_app_open_acc: integer (nullable = true)
 |-- sec_app_revol_util: double (nullable = true)
 |-- sec_app_open_il_6m: integer (nullable = true)
 |-- sec_app_num_rev_accts: integer (nullable = true)
 |-- sec_app_chargeoff_within_12_mths: integer (nullable = true)
 |-- sec_app_collections_12_mths_ex_med: integer (nullable = true)
 |-- sec_app_mths_since_last_major_derog: integer (nullable = true)
 |-- hardship_flag: string (nullable = true)
 |-- hardship_type: string (nullable = true)
 |-- hardship_reason: string (nullable = true)
 |-- hardship_status: string (nullable = true)
 |-- deferral_term: integer (nullable = true)
 |-- hardship_amount: double (nullable = true)
 |-- hardship_start_date: string (nullable = true)
 |-- hardship_end_date: string (nullable = true)
 |-- payment_plan_start_date: string (nullable = true)
 |-- hardship_length: integer (nullable = true)
 |-- hardship_dpd: integer (nullable = true)
 |-- hardship_loan_status: string (nullable = true)
 |-- orig_projected_additional_accrued_interest: double (nullable = true)
 |-- hardship_payoff_balance_amount: double (nullable = true)
 |-- hardship_last_payment_amount: double (nullable = true)
 |-- issue_d: string (nullable = true)
```



### A7. Lab Use Case:
Data engineering for Loan analysis on loan data in a data lake.

### A8. Lab Goals
1. Just enough knowledge of Apache Iceberg & its core capabilities
2. Just enough knowledge of using Apache Iceberg with Dataproc Serverless Spark on GCP via Jupyter notebooks on Vertex AI Workbench managed notebooks
3. Ability to demo Apache Iceberg on Dataproc Serverless Spark
4. Just enough Terraform for automating provisioning, that can be repurposed for your workloads

### A9. Lab Duration
~ 90 minutes or less

### A10. Lab Format
Fully scripted, with detailed instructions intended for learning, not necessarily challenging

### A11. Lab Approximate Cost
< $100

### A12. Credits

| # | Google Cloud Collaborators | Contribution  |
| -- | :--- | :--- |
| 1. | Nikhil Manjunatha, Strategic Cloud Engineer | Creator |
| 2. | Anagha Khanolkar, Customer Engineer | Ideation |


### A14. Contributions welcome
Community contribution to improve the lab is very much appreciated. <br>

### A15. Getting help
If you have any questions or if you found any problems with this repository, please report through GitHub issues.

<hr>


## B. Environment Provisioning

### B1. Clone this repo

```
cd ~
git clone https://github.com/nikhil6790/table-format-lab-iceberg.git
```

<hr>

### B2. Declare Variables

Modify the location variable to your preferred GCP region.

```
PROJECT_ID=`gcloud config list --format "value(core.project)" 2>/dev/null`
PROJECT_NBR=`gcloud projects describe $PROJECT_ID | grep projectNumber | cut -d':' -f2 |  tr -d "'" | xargs`
PROJECT_NAME=`gcloud projects describe ${PROJECT_ID} | grep name | cut -d':' -f2 | xargs`
GCP_ACCOUNT_NAME=`gcloud auth list --filter=status:ACTIVE --format="value(account)"`
ORG_ID=`gcloud projects get-ancestors $PROJECT_ID | grep 'organization'| cut -d' ' -f1|xargs`
YOUR_GCP_MULTI_REGION="US"
LOCATION="us-central1"


echo "PROJECT_ID=$PROJECT_ID"
echo "PROJECT_NBR=$PROJECT_NBR"
echo "PROJECT_NAME=$PROJECT_NAME"
echo "GCP_ACCOUNT_NAME=$GCP_ACCOUNT_NAME"
echo "ORG_ID=$ORG_ID"
echo "YOUR_GCP_MULTI_REGION=$YOUR_GCP_MULTI_REGION"
echo "LOCATION=$LOCATION"
```

<hr>

### B3. Terraform Provisioning

#### B3.1. Enable Google APIs and Update Organization Policies

```
cd ~/table-format-lab-iceberg/lab-setup/iac/org_policy
terraform init
```

```
terraform apply \
  -var="project_id=${PROJECT_ID}" \
  --auto-approve
```

<hr>

#### B3.2. Provision the lab resources

```
cd ~/table-format-lab-iceberg/lab-setup/iac
terraform init
```

```
terraform plan \
  -var="project_id=${PROJECT_ID}" \
  -var="project_nbr=${PROJECT_NBR}" \
  -var="org_id=${ORG_ID}" \
  -var="location=${LOCATION}" \
  -var="gcp_account_name=${GCP_ACCOUNT_NAME}"
 ```

 ```
terraform apply \
  -var="project_id=${PROJECT_ID}" \
  -var="project_nbr=${PROJECT_NBR}" \
  -var="org_id=${ORG_ID}" \
  -var="location=${LOCATION}" \
  -var="gcp_account_name=${GCP_ACCOUNT_NAME}" \
  --auto-approve
 ```

<hr>

## C. Create a Dataproc Interactive Spark Session

Edit region as appropriate-
```
PROJECT_ID=`gcloud config list --format "value(core.project)" 2>/dev/null`
PROJECT_NBR=`gcloud projects describe $PROJECT_ID | grep projectNumber | cut -d':' -f2 |  tr -d "'" | xargs`
SESSION_NAME="iceberg-lab"
LOCATION="us-central1"
HISTORY_SERVER_NAME="iceberg-sphs-${PROJECT_NBR}"
METASTORE_NAME="iceberg-hms-${PROJECT_NBR}"
HADOOP_WAREHOUSE_DIR="gs://iceberg-spark-bucket-${PROJECT_NBR}/iceberg-warehouse-dir"
SUBNET="spark-subnet"
NOTEBOOK_BUCKET="gs://s8s_notebook_bucket-${PROJECT_NBR}"


gcloud beta dataproc sessions create spark $SESSION_NAME-$RANDOM  \
--project=${PROJECT_ID} \
--location=${LOCATION} \
--property=spark.jars.packages="org.apache.iceberg:iceberg-spark-runtime-3.3_2.13:1.1.0" \
--history-server-cluster="projects/$PROJECT_ID/regions/$LOCATION/clusters/${HISTORY_SERVER_NAME}" \
--metastore-service="projects/$PROJECT_ID/locations/$LOCATION/services/${METASTORE_NAME}" \
--property="spark.sql.extensions=org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions" \
--property="spark.sql.catalog.spark_catalog=org.apache.iceberg.spark.SparkSessionCatalog" \
--property="spark.sql.catalog.spark_catalog.type=hive" \
--property="spark.sql.catalog.hdp_ctlg=org.apache.iceberg.spark.SparkCatalog" \
--property="spark.sql.catalog.hdp_ctlg.type=hadoop" \
--property="spark.sql.catalog.hdp_ctlg.warehouse=${HADOOP_WAREHOUSE_DIR}" \
--service-account="iceberg-lab-sa@${PROJECT_ID}.iam.gserviceaccount.com" \
--subnet=$SUBNET 

```
The author typcially has two sessions handly to expedite switching across notebooks.

<hr>

## D. Connect to Vertex AI Workbench in the Cloud Console

The Terraform creates a Vertex AI Workbench managed notebook instance and loads the Icerberg notebooks.
Navigate into the managed notebook instance, open the first Icerberg notebook (IcebergLab-1.ipynb), and pick a Spark kernel - the one created by #C above.

<hr>

## E. Lab guide
Note: The notebooks have scope and narratives defined in them, so there is no explicit lab guide for this lab. The features of Iceberg covered in the labs are listed [above](README.md#features-covered)<br>

Run through each notebook, sequentially.<br>
Review Apache Iceberg documentation at - <br>
https://iceberg.apache.org/ <br>


## F. Dont forget to
Shut down/delete resources when done to avoid unnecessary billing.

<hr>

## G. Release History

| Date | Details |
| -- | :--- |
| 20230211 |  Notebooks 1-8, + Terraform |

