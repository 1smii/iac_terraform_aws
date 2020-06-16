*** CATION ***
*UPDATES/BUGS*

- Repositorio de cookbook nginxphp está en creación y aun puede contener errores-
	https://github.com/1smii/chef_cookbooks.git

- Bug con el rol iam para el stack apache2php ***

**Para inicializar el directorio es necesario tener un usuario en AWS con clave pública generada y descargada en nuestra máquina linux

terraform init - Para iniciar el directorio
terraform plan - Comprobación de errores antes de lanzamiento
terraform apply -auto-approve - Si todo está correcto

**Modificar vars.tf para personalizar la infraestructura.
