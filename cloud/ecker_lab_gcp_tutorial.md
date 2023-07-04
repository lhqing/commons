# GCP setup tutorial

## Storage
There are two source of cost when using GCS: storage and access/egress. The price of both cost depends on the four file storage classes: Standard, Nearline, Coldline, Archive.

Before start using GCS, you should be aware of the price of all four storage classes in GCS. And you should also be aware of the data transfer (egress) fee to different GCS region or to on-prem storage. The GCP price calculator will list up-to-date price and help you estimate cost: https://cloud.google.com/products/calculator

### Object Storage Bucket Mode
There are two storage mode for object storage when you start a new GCS bucket: normal bucket or autoclass manageded bucket. You should chose one of them depending on the file access pattern.

To have a complete understanding of the file classes, please read the official document: https://cloud.google.com/storage/docs/control-data-lifecycles

#### Normal bucket
Pros: You can setup custom life cycle, such as putting files into certain storage class based on their file name suffix. This works best when your files are relatively stable.
Cons: 
- You need to be responsible for all files' storage class; 
- Files put into cheaper classes (Nearline, Coldline, Archive) will have panelties if you didn't store them for certain time (read the doc); 
- Files put into cheaper classes will have more expensive access and egress fee (read the doc and check the calculator).

Tips: I'd use normal bucket for storing raw data, mapping directires, which are stable and have constant pattern.

#### AutoClass bucket
Pros: 
- All files storage class will be managed automatically, please read the docs for details before you use it.
- There is no panelty for cheaper classes, the access and egress fee is also managed under autoclass.
Cons:
- You can not apply custom life cycle to adjust file storage when using autoclass.

Tips: I'd use autoclass bucket for storing active data or my analysis notebooks/results bucket, which are active and do not have constant pattern.


## Use skypilot to start VM
I use skypilot to start VM in two step:

1. I create a custom image with this script: https://github.com/lhqing/commons/blob/main/cloud/setup_base_image.gcp.sh. In this image, I pre-installed some common tools, setup mamba etc.

2. I then use skypilot to start VM and do my daily interactive analysis or batch jobs. An example of skypilot VM yaml is here: https://github.com/lhqing/commons/blob/main/bican/sky-jupyter.yaml 

I wrote a more detailed blog about using skypilot here: https://medium.com/@hanqingsalk/analyzing-the-whole-mouse-brain-atlas-on-the-cloud-with-skypilot-c423cffc00a8


## Billing
You can get the billing information of your project using this URL (Change the "YOUR_PROJECT" to your project name): https://console.cloud.google.com/billing/0191B8-7ADD66-F9F5C9/reports;timeRange=LAST_30_DAYS;grouping=GROUP_BY_SKU;projects=YOUR_PROJECT?project=YOUR_PROJECT

Be sure to monitor your cost and make sure the cost is as expected.
