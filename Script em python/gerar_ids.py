import random

receitas  = open('insert_receita.txt', 'r').read().split('\n')
insert_receitas = open('insert_receita_gerado.txt','w')
cont = 1
for i in range(len(receitas)):
    pronto = receitas[i]
    if ( i % 2 == 0 ):
        pronto = receitas[i][:28] + str(cont) + "," + str(cont) + ","
        cont = cont + 1
    insert_receitas.writelines(pronto + "\n")
insert_receitas.close()

# consultas = open('insert_consulta.txt', 'r').read().split('\n')
# insert_consultas = open('insert_consulta_gerado.txt','w')
# cont = 1
# for i in range(len(consultas)):
#     pronto = consultas[i]
#     if ( i % 5 == 0 ):
#         pronto = consultas[i][:29] + str(cont) + "," + str(cont) + ","
#         cont = cont + 1
#         print(pronto)
#     insert_consultas.writelines(pronto + "\n")
# insert_consultas.close()
#
# SMALLDATETIME YYYY-MM-DD hh:mm:ss
# medicos = open('insert_medico_gerado.txt', 'r').read().split('\n')
# id_medicos = []
# pacientes = open('insert_paciente_gerado.txt', 'r').read().split('\n')
# id_pacientes = []
# for i in range(30):
#     id_medicos.append(medicos[i][27:37])
#     id_pacientes.append(pacientes[i][29:44])
# 
# agendas = open('insert_agenda.txt', 'r').read().split('\n')
# insert_agendas = open('insert_agenda_gerado.txt','w')
# cont = 0
# for agenda in agendas:
#     escolhe_ids = agenda[:42] + str(random.choice(id_medicos)) + "," + str(random.choice(id_pacientes)) + ");"
#     escolhe_data = escolhe_ids[:29] + "'" + str(random.randint(10,30)) + "/" + str(random.randint(10,12)) + "/2018 " + str(random.randint(10,17)) + ":" + str(random.randint(10,60)) + ":00'" + escolhe_ids[41:]
#     pronto = escolhe_data[:27] + str(cont) + escolhe_data[-51:]
#     insert_agendas.writelines(pronto + "\n")
#     cont = cont + 1
# insert_agendas.close()
# 
# pacientes = open('insert_paciente.txt', 'r').read().split('\n')
# medicos = open('insert_medico.txt', 'r').read().split('\n')
# usados = []
# 
# def gera_15():
#     s = ''
#     for i in range(15):
#         s += str(random.randint(1,9))
#     if s in usados:
#         return gera_15()
#     else:
#         usados.append(s)
#         return s
# 
# def gera_10():
#     s = ''
#     for i in range(10):
#         s += str(random.randint(1,9))
#     if s in usados:
#         return gera_10()
#     else:
#         usados.append(s)
#         return s
# 
# pacientes_gerados = open('insert_paciente_gerado.txt','w')
# for paciente in pacientes:
#     inicio = paciente[:29]
#     ind = gera_15()
#     fim = paciente[44:]
#     insert = inicio + ind + fim + '\n'
#     print(insert)
#     pacientes_gerados.writelines(insert)
# pacientes_gerados.close()
# 
# medicos_gerados = open('insert_medico_gerado.txt','w')
# for medico in medicos:
#     inicio = medico[:27]
#     ind = gera_10()
#     fim = medico[37:]
#     insert = inicio + ind + fim + '\n'
#     print(insert)
#     medicos_gerados.writelines(insert)
# medicos_gerados.close()