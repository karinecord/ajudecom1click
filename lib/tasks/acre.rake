# namespace :acre do
#   desc "TODO"
#   task obter_dados_iml: :environment do
#
#     require 'mechanize'
#
#     a = Mechanize.new
#
#     a.get('http://www.iml.pr.gov.br/webservices/identificadosNaoReclamados/') do |page|
#       lista_tr = page.search('table tr')
#       lista_tr.shift # descarta o cabecalho da tabela
#       lista_tr.each do |tr|
#         tds = tr.search('td')
#         puts tds[0].text
#         puts tds[1].text
#         puts tds[2].text
#         puts tds[3].text
#         puts tds[4].text
#         puts tds[5].text
#         puts '-----------'
#       end
#     end
#   end
#   # desc "TODO"
#   # task obter_dados_policia_civil_bo: :environment do
#   #   require 'mechanize'
#
#     # mechanize = Mechanize.new
#     # page = mechanize.get('http://www.delegaciaonline.pb.gov.br/delegacia-web/pages/verificarBoletim.xhtml')
#     #
#     # form = page.form('form')
#     # form['form:codigoDeControleInput'] = '16430982017'
#     # page = mechanize.submit(form)
#     # pp form
#
#
#
#     # mechanize = Mechanize.new
#     # page = mechanize.get('https://www.ssllabs.com/ssltest/')
#     #
#     # form = page.form('nill')
#     # form.d = 'www.secnet.com.br'
#     # page = mechanize.submit(form)
#     # pp page
#   #
#   # end
#   # end