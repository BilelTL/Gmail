require "google_drive"
require "gmail"

def group_mail(ville, destinataire) #la methode qui envoie le mail personnalisé à l'adresse choisie

gmail = Gmail.connect("kitri.jules@gmail.com", "saburo31") #on se connecte #adressepoubelle 
	gmail.deliver do  
			to "#{destinataire}"
			subject "The Hacking Project "
			html_part do
				content_type "text/html; charset = UTF-8"
				body "<p> Bonjour,
					Je m'appelle Jules, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle <strong>The Hacking Project</strong> (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.

					Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{ville}, où vous pourrez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec #{ville} !

					Charles, co-fondateur de <strong>The Hacking Project</strong> pourra répondre à toutes vos questions : 06.95.46.60.80
					</p>"
				end
		end
	
	end
	



def data_spreadsheet() # notre boucle 
	session = GoogleDrive::Session.from_config("config.json")
ws = session.spreadsheet_by_title("mairies").worksheets[0]
gmail = Gmail.connect("kitri.jules@gmail.com", "saburo31")
	i= 1
	while ws[i,2].empty? == false # si la cellule "adresse" est vide il n'y touche pas
		i+=1
		group_mail(ws[i,1],ws[i,2])
	end
end
data_spread()
#NB n'oublies pas d'appeler ta fonction
#Sinon c'est plus dur



