# Jenkins-AWS


Ce référentiel contient la documentation des quatre infrastructures AWS déployées, chacune accompagnée de sa topologie respective. Vous trouverez ci-dessous des informations de base sur chaque infrastructure.

---
### Guide d'Utilisation

Les différents fichiers que vous trouvez correspondent chacun à un job dédié dans Jenkins. Le contenu de ces fichiers doit être placé à l'intérieur du job correspondant en utilisant l'option '[Build Step]' avec l'exécution shell.


## Choose infra

### Choix de templates 

![choose infra](images/templat-infra.png)



### Configuration

Il faut mettre en place 3 parametres : deux de types string, un de type active choice paramter.
Dans le parametre active choice parameter, il faut cocher Groovy Script et mettre dans le contenu ce qui se trouve dans le fichier '[ list_of_folder.groovy]'.

---

## Desctruction infrastructure

### Suppression d'infrastructure

![choose infra](images/destruct.png)


### Configuration

Il faut ajouter un seul parametre active choice parameter et il faut cocher Groovy Script et mettre dans le contenu ce qui se trouve dans le fichier '[ list_of_folder.groovy]'.

---

## Git operation

### Mise en place d'une infrastructure simple

![choose infra](images/git.png)


### Configuration

Il y a deux paramètres de type chaîne de caractères : l'un pour le token et l'autre pour l'URL.
NB: Il faut generer depuis le github un token et l'url se trouve sur le github.

---

##  Credential 

### Automatisation ACCESS Key 

![choose infra](images/crendential.png)


### Configuration

Il y a deux paramètres de type string : l'un c'est pour la region et l'autre pour access_key et access_id.



---

ATTENTION!! Toutes les variables dont le nom commence par le symbole $ représentent des noms de paramètres.
