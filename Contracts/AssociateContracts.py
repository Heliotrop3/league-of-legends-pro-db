with open("InitializeContracts.sql", "a") as f:
    f.write('\n\n-- Auto-Generated association of contracts with players\n')
    f.write('BEGIN TRANSACTION;\n')
    for i in range(1,105):
        f.write('UPDATE Players SET ContractID = {} WHERE PlayerID = {};\n'.format(i,i))
    f.write('END TRANSACTION;')
