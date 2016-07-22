---
layout: post
published: false
title: Update Dell host to vSphere 6 using VUM
---
In this post I will go through the steps involved in the process of updating a Dell server running ESXi 5.5 to the latest version of vSphere. I mention Dell because I am going to use a customized Dell ISO to get the latest certified drivers and patches.

Why do I use a Dell customized ISO?

- Ease of drivers and specific packages management.
- Simplify and shorten the execution of support tickets.
- Dell server, Dell software, it makes sense to me.

In order to have an idea of the difference I downloaded the latest ISO build "3620759" from the VMware website to have the stock ISO and from the Dell website to have their customized one and compared it with PowerShell.

<= are the objects only present in the reference (ESXiStock)
=> are the objects only present in the difference (ESXIDell)

![vibs-difference.jpg]({{site.baseurl}}/img/vibs-difference.jpg)

The 2 main things we can note from this comparison are:
- More recent vib versions in the Dell build.
- More vibs in the Dell build, most likely drivers for hardware used in their servers.

I was actually surprised to see that the Dell build embedded more recent drivers but I guess VMware relies on the manufacturers to provide their ISOs with versions certified for their Support, which would make perfect sense.

## Download the right iso image

First of all we need to download the latest version of the Dell customized vSphere 6.0 image. The Dell support website is a little bit weird as I couldn't find my way through to the vSphere downloads but google got me there: [www.dell.com/support/home/us/en/04/Drivers/DriversDetails?driverId=2RNCX](www.dell.com/support/home/us/en/04/Drivers/DriversDetails?driverId=2RNCX)

As of today the latest Dell version is the 6.0U2, A02.

![update6-0.0.jpg]({{site.baseurl}}/img/update6-0.0.jpg)

I scroll down to check it is the latest version and go to the most recent one if there is one. Even though it's not really necessary (as long as your server is in the [hcl](http://www.vmware.com/resources/compatibility/search.php)) I check that my model is listed under the compatible systems. Blade M630 in my case.

![update6-0.jpg]({{site.baseurl}}/img/update6-0.jpg)

That done I find the iso image in the available formats and click "download file".

----------------
