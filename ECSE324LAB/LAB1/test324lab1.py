file_1 = ('shit1.txt')
file_2 = ('expectb1.txt')
def com_2_file(a,b):
    a = open(a)
    b = open(b)
    s1 = a.read()
    s2 = b.read()
    print(s1==s2)
    return s1==s2
def pf(s):
    file_2 = open(s)
    s2 = file_2.read()
    l2 = s2.split('\n')
    for each in l2:
        neweach = ''.join(each.split(' '))
        neweach= neweach[16:-16]
        op = neweach[:2]
        cond = neweach[2:5]
        I = neweach[5]
        Dis = neweach[6:9]
        src1 = neweach[9:12]
        src2  = neweach[12:16]
        if op == '00':
            print('ALU',end = '')
        elif op == '01':
            print('Branch',end = '')
        elif op == "10":
            print('LOAD',end = '')
        else:
            print("STORE",end = '')
        print('||',end = '')
        if op == '01':
            if cond == '000':
                print('EQ',end = '')
            if cond == '001':
                print('NE',end = '')
            if cond == '010':
                print('LT',end = '')
            if cond == '011':
                print('LE',end = '')
            if cond == '100':
                print('GT',end = '')
            if cond == '101':
                print('GE',end = '')
        else:
            if cond == '000':
                print('ADD',end = '')
            if cond == '001':
                print('SUB',end = '')
            if cond == '010':
                print('AND',end = '')
            if cond == '011':
                print('OR',end = '')
            if cond == '100':
                print('NOR',end = '')
            if cond == '101':
                print('LSL',end = '')
            if cond == '110':
                print('LSR',end = '')
            if cond == '111':
                print('ASR',end = '')    
            
        print('||',end = '')
        #print(neweach)
        ss = str(hex(int(neweach,2)))[2:]
        if len(ss) != 4:
            ss = (4-len(ss))*'0' + ss
            
        print(ss,end = '')
        if op == '01':
            print("||move ",end = '')
        else:
            print("||Register ",end = '')
            
        print(int(Dis,2),end =' ')
        print(str('R'+str(int(src1,2))+'R'+str(int(src2,2))) )
        

com_2_file(file_1,file_2)
