---
layout: post
published: true
title: Convert LUN canonical name to datastore and vice versa
---
Someone recently asked in a [VMTN post](https://communities.vmware.com/thread/544815) for a way to know what datastore is associated to a LUN canonical name (naa.xxxxxx). It can actually be quite annoying to find which datastore we are talking about when all we have is a canonical name. It's either putting on the mining lamp and look at the datastores' backing devices in the web client one by one or write a 2km long one liner in powerCLI after 10 tries.

![schemalunds.jpg]({{site.baseurl}}/img/schemalunds.jpg)

I actually wrote 2 small functions a while ago to convert a canonical name into a datastore name and the other way around, so I just stuck it in a reply on this VMTN post.

Here are the 2 functions, sorry the datastore names are blurred but you get the idea.

**Convert Datastore to canonical name.**
- Input object is one or multiple datastore objects

Usage: _I want all the datastores and what luns they are on_

```Powershell
Convert-DSToCanonical (get-Datastore)
Get-Datastore | Convert-DSToCanonical
```

![dstocan.jpg]({{site.baseurl}}/img/dstocan.jpg)

**Convert Canonical name to datastore.**
- Input object is one or multiple strings

Usage: _What datastores are on the Equallogic luns mounted on Host-B_

```Powershell
Get-ScsiLun -VmHost "Host-B" | where vendor -eq EQLOGIC | Convert-CanonicalToDS
```

![cantods.jpg]({{site.baseurl}}/img/cantods.jpg)

## Functions

```Powershell
Function Convert-DSToCanonical {

param(
    [Parameter(Mandatory = $True,ValueFromPipeline=$True)]
    [VMware.VimAutomation.ViCore.Impl.V1.DatastoreManagement.VmfsDatastoreImpl[]]
    $datastore
)

Process {

$datastore | ForEach-Object {
 
    $CanonicalName = (Get-View $_).Info.Vmfs.Extent.diskname

    [pscustomobject]@{
        CanonicalName = $CanonicalName
        Datastore     = $_.name
    }
  
}

}
}
```

```Powershell
Function Convert-CanonicalToDS {

param(
    [Parameter(Mandatory = $True,ValueFromPipeline=$True)]
    [string[]]
    $canonicalname
)

Begin {
    $Table = Convert-DSToCanonical (get-datastore | where type -eq VMFS)
}

Process{

    $canonicalname | ForEach-Object {
        $Table | where CanonicalName -eq $_
    }

}

}
```

In order to get these commands available in your powershell session, you need to add them in your powershell modules (.psm file).
