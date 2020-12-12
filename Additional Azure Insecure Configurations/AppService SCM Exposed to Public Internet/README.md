# AppService SCM Exposed to Public Internet

App Service also deploys Kudo or KudoLite SCM administrator portal, by default this portal is exposed to the public Internet but is secured around an AAD and RBAC identity boundary. To further secure this you may want to limit exposure of SCM administrator portal to a data center public ip address using Virtual Network ACL Restrictions.

https://docs.microsoft.com/en-us/azure/app-service/app-service-ip-restrictions#scm-site

[Inspiration came from reading about vulnerabilities in App Service that were patched some time ago](https://www.intezer.com/blog/cloud-security/kud-i-enter-your-server-new-vulnerabilities-in-microsoft-azure/ "Inspiration came from reading about vulnerabilities in App Service that were patched some time ago")
