
#!/usr/bin/perl

#Bibliotecas
use strict;
use warnings;
use URI;
use LWP::UserAgent;
use HTTP::Request;
use HTML::TableExtract;
use Getopt::Long;



my $mfrom = ''; #mail is from
my $mto = ''; #mail is to
my $q = '';# query
my $ayuda = 0; #establecemos ayuda como 0 si se llama a este manda un valor de 1

#Establecemos las banderas usando en terminal -Bandera(GetOptions) y el argumento
GetOptions(
 't_mfrom=s' => \$mfrom,
 't_q=s' => \$q,
 't_mto=s' => \$mto,
 'h' => \$ayuda
)or die "Ingrese: perl cliente.pl -h, para mas ayuda.\n";

if($ayuda){
  print "Banderas disponibles:\n";
  print "-t_q [texto clave de busqueda]\n-t_mfrom [texto clave de busqueda] :buscar con mail's\n-t_mto [texto clave de busqueda] :buscar con mail's\n\n";
}else {
  #coneccion a la pagina
  my $ua = LWP::UserAgent->new;
  my $url = URI->new('https://www.wikileaks.org/hackingteam/emails/');

  #Atributos que se cambian para hacer la consulta
  $url->query_form('q' => $q ,'mfrom' => $mfrom,'mto' => $mto);

  #codigo html
  my $response = $ua->get($url);

  #contenido del html
  my $contenido = $response->content();

  #Nombre de las columnas
  my $headers = ['Doc #','Date','subject', 'From','To'];

  #Extraccion del contenido
  my $table_extract = HTML::TableExtract->new(headers => $headers);
  $table_extract->parse($contenido);
  print "Tabla\n\n";
  #Imprimir en terminal
  foreach my $row($table_extract->rows){
   print join("\n\n\n\t",@$row), "\n\n\n";
  }
 }
