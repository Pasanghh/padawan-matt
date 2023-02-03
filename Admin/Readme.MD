Notes for Project-1

Once a developer pushes changes it should trigger cloud build which will attempt to enter the VPC network through the firewall rules set.

First we need to set up the backend tfstate. Create terraform for bucket then set up the backend. Enable object versioning to keep the history of your deployments.

Need a service account most likley user managed service account. 

Need a static external IP for our VM. This IP will be set into our firwall rules and somehow grant limited access to our devs or customers.

Need a shared VPC. This will allow us to seperate our projects and delegate administrative respoinsibilities so for example having devs access to creating and deleting instances that use approved subnets in the shared VPC host project (ServiceProjectAdmins). 

TASK 
Give CI/CD Identity to devs allowing them to provision resources. Should not be able to provision with justa dev login. However they should have read-only access to aid trouble shooting.

seperation of duties control for external access, where devs can be given access but in a limited way with a seperate admin team (us) responsible for limiting the external access to sepcific sites.


Likely to need 2 pipelines one to provision the underlying resources. 
The other as a test developer pipeline to ensure developer access remains functional, if contstrained. 

Once the controlled environment is set up we need to allow the other team developer access who will attempt to break out of our controls.

