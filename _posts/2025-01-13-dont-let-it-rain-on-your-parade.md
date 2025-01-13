---
layout: post
title: Don't let it rain on your parade..
subtitle: Optimize cloud storage costs for private use
tags: [AWS, Cloud, S3, Google Drive]
thumbnail-img: /assets/img/rainthumb.png
cover-img: /assets/img/RainRoad.jpeg
comments: false
mathjax: true
category: tech-blog
---

Google accounts are ubiqutous these days. It would be a daunting task to find someone who's not using Google's services. The seemless integration of photos, drive, gmail, calendar is definitely a lure. The ones who are not using Google are almost certainly on Apple's ecosystem. There truely isn't a third option that even comes close. I belong to the community of Google users, and have had **15 GB** free quota since forever. The problem arises when you start to run out of space on Google's free quota.

{: .box-note}
**Premise:** 
The first and most economical form of digital storage is a hard drive (external, preferrably which is also portable). Hard drive's however doesn't offer any redundancy, so you may lose your data if one fails. Workaround for this is to manually make two or more copies of data on similar independent hard drives (most economical, however time consuming, recurring manual effort). 

{: .box-note}
**Alternative:** 
The next alternative to harddrives is to own your own NAS. One can choose to build one's own, hardware / software DIY NAS (Would recommend [Jeff Geerling's](https://www.youtube.com/c/JeffGeerling) youtube channel for whoever's interested) or buy a commercial (NVMe / SSD / Harddisk) based NAS. This option however is not much feasible for private users owing to the staggering upfront cost of setting one up, accompanying cooling costs (very real in tropical/equatorial countries) and running costs (also the accompanying noise if you're setting one up at home). Unlike a portable USB harddrive, a NAS doesn't make much sense if you intend to boot it, only when you need to use it, as booting it could be super slow. It would be a great option though, if redundancy and availability is a priority in a geaographic location where internet costs are exorbitant, internet use is not unlimited and climate is cold (yes such places exist!).

## Use Case:

Now assuming you're on Google's ecosystem and you're about to exhaust your 15 GB free quota. You have to have your data on cloud (partially / completely) depending on requirement which could range from ensuring redundancy to accessibility of data over the internet. Given these circumstances the options offered by Google is to rent additional "Google One" space. At the time of writing this article 100 GB space is being offered at INR 1300 annually (approx USD 15). This may be comfortably affordable for some, however for many this recurring fee may be unaffordable or not justified based on their data volume / usage requirement. For Apple ecosystem also the story isn't much different.

## Rant:

Switch to enterprise cloud object storage offerings such as [AWS S3](https://aws.amazon.com/s3/) which enables you to rent only what you use, all while tapering costs further by choosing storage class offerings based on frequency of use (this is practical since we don't use everything on cloud every day), automated data transition lifecycle policies which can be configured to move files from faster to slower storage class, based on file ageing - thus lowering costs further. All while offering enterprise grade security, availability and configurable redundancy.

If configured optimally, one can stand to lower cloud usage costs way less than what is being charged by Google One, Apple and the likes.

{: .box-warning}
**Note:** For following tables, "Cost" is in USD, "Rate" is USD per GB, "Duration" is in months and "Data" is in GB.

Annual cost of 100 GB space (with 80GB used) on Google One:

| Service | Duration | Cost |
| :------ |:--- | :--- |
| Google One | 12 | 15 |

Annual cost of 80 GB data (including 5 GB frequently accessed) on AWS S3 with [transition lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/userguide/lifecycle-transition-general-considerations.html) enabled to archive data from S3 Standard to S3 One Zone - IA (Infrequent Access) after initial 30 days:

| Service | Storage Class | Data | Duration | Rate | Cost |
| :------ |:--- | :--- | :--- | :--- | :--- |
| AWS S3 | S3 Standard | 80 | 1 | 0.023 | 1.84 |
| AWS S3 | S3 Standard | 5 | 11 | 0.023 | 1.265 |
| AWS S3 | S3 One Zone - IA | 75 | 11 | 0.01 | 8.25 |
| AWS S3 |  |  |  |  | 11.355 |

For accurate calculation estimates kindly use [AWS Pricing Calculator](https://calculator.aws/) or [AWS S3 pricing policy](https://aws.amazon.com/s3/pricing/).

## Rationale:

My intention here is not to promote AWS, over Google or any other cloud service. The intention is to share the idea of optimizing cloud cost savings by paying for what you use rather that renting out resources that you may or may not end up using for the rented period. Concept of renting resources on cloud is fundamentally different from renting resources in real life such as real-estate. The small cost difference elaborated above compounds over time, and that can effectively translate to substantial cost savings for the informed customer.

In the first section, of this article I had unequivocally stated Google and Apple ecosystems are uncontended (for the time being). Then am I asking you to move away from these ecosystems? Obviously no. Then you may ask, what's the point? The point is to try and survive within the free quota limits and opt for enterprise grade Op-Ex cloud service providers for all your other cloud requirements. Offerings such as [Azure Blob Storage](https://azure.microsoft.com/en-us/products/storage/blobs/?msockid=2fabc323956261b42d0fd28d94906091) and [Google Cloud Object Storage](https://cloud.google.com/storage) are comparable to AWS S3 and are better cost optimized than Google One and Apple.