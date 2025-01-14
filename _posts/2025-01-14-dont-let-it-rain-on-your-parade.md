---
layout: post
title: Don't let it rain on your parade...
subtitle: Optimize cloud storage costs for private use
tags: [AWS, Cloud, S3, Google Drive]
thumbnail-img: /assets/img/rainthumb.png
cover-img: /assets/img/RainRoad.jpeg
comments: true
mathjax: true
category: tech-blog
---

Google accounts are ubiquitous these days! It would be daunting to find someone who’s not using Google’s services. The seamless integration of Photos, Drive, Gmail and Calendar is tempting. I hope I won’t be hurting any sentiments if I say that those outside of the Google ecosystem are almost certainly using Apple products. What leads to this domination are the two most popular smartphone platforms, Android and Apple IOS. There truly isn’t a third option that even comes close. Without further ado, I confide, I belong to the community of Google users and have had **15 GB** free quota since forever. But... alas! The problem arises when you run out of space on Google One’s free quota.

{: .box-note}
**Premise:** 
The first and most economical form of digital storage is a hard drive (USB external, preferably, which also makes it portable). Hard drives, however, don’t offer any redundancy. But nothing comes free mes amis! The failure of this economical boon may make you lose your data. Though a rudimentary workaround would be to make two or more data copies on similar independent hard drives. Just to keep in mind, this might be time-consuming and would require recurring manual effort.

{: .box-note}
**Alternative:** 
The next alternative to hard drives is to own your own NAS. One can choose to build one’s own hardware / software DIY NAS (Would recommend [Jeff Geerling’s](https://www.youtube.com/c/JeffGeerling) YouTube channel for whoever’s interested) or buy a commercial (NVMe / SSD / Hard drive) NAS. This option however is not viable for private users owing to the staggering upfront cost of setting one up, accompanying cooling costs (very real in tropical/equatorial countries) and running costs (also the accompanying noise if you’re setting one up at home). Unlike a portable USB hard drive, a NAS makes less sense if you intend to boot it, only when you need to use it, as booting it, could be super slow. Also, it is a server, and meant to remain up and available. **NAS could be a blessing if redundancy and availability is a priority in a cold geographic location, where internet costs are exorbitant, and internet usage is limited.** (Such places exist! Take my words!!)

## Use Case:

Assuming one is on Google’s ecosystem and about to exhaust the 15 GB free quota.

**Condition:** One must have the data on cloud (partially / completely) depending on the requirement which could range from ensuring redundancy to accessibility of data over the internet.

Given these circumstances, the option offered by Google is to rent an additional “Google One” space. At the time of writing this article, Google offered 100 GB of storage for INR 1300 annually (approx. USD 15). This may be comfortably affordable for some, however, for many, this recurring fee may be unaffordable or unjustified, based on their data volume / usage requirement. Ironically, the story isn’t much different for the Apple ecosystem as well.

## Rant:

Switch to Enterprise Cloud Object Storage offerings such as [AWS S3](https://aws.amazon.com/s3/) which empowers to rent only what is being used, all while tapering costs further by choosing storage class offerings based on frequency of use (this is practical since we don’t use everything on cloud every day), automated data transition lifecycle policies can help transition files from faster to slower storage class, based on file ageing - thus lowering costs, all the while offering enterprise grade security, availability and redundancy.

If configured optimally enough, one can stand to lower annual cloud usage costs much less than what is being charged by Google One, Apple and the likes.

{: .box-warning}
**Note:** Table Legends: “Cost” is in USD, “Rate” is USD per GB, “Duration” is in months and “Data” is in GB.

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
| AWS S3 | Total Cost |  |  |  | 11.355 |

For accurate calculation estimates, kindly use [AWS Pricing Calculator](https://calculator.aws/) or [AWS S3 pricing policy](https://aws.amazon.com/s3/pricing/).

## Rationale:

My intention here is not to promote AWS over Google or any other cloud service. The goal is to optimize cloud cost savings by only paying for used resources, avoiding paying for potentially unused rented resources. Renting resources in the cloud is unlike renting real estate or other physical assets; the core concepts are distinct. The small cost difference elaborated above compounds over time, and that can effectively translate to substantial cost savings for the informed customer. Nobody’s digital footprint grows to 100 GB overnight.

In the first section of this article, I unequivocally stated Google and Apple ecosystems are uncontended (for the time being). Then am I asking anyone to move away from these ecosystems? Definitely not. But what’s the point then?

**The point is to survive within the free quota limits and opt for enterprise-grade Op-Ex cloud service providers for all your additional cloud storage requirements.** Offerings such as [Azure Blob Storage](https://azure.microsoft.com/en-us/products/storage/blobs/?msockid=2fabc323956261b42d0fd28d94906091) and [Google Cloud Object Storage](https://cloud.google.com/storage) are comparable to AWS S3 and are better priced than Google One and Apple. So while your digital footprint on cloud grows, don’t let it rain on your parade...

*Cover image courtesy [@therandomexplorer](https://www.instagram.com/therandomexplorer?igsh=enBmajh3N2t4dDV6)*