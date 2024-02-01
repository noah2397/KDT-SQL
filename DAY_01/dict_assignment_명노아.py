world=dict()
data=[["Seoul", "South Korea", "Asia" ,9655000],
      ["Tokyo" ,"Japan" ,"Asia" ,14110000],
      ["Beijing", "China", "Asia" ,21540000],
      ["London" ,"United Kingdom", "Europe" ,14800000],
      ["Berlin", "Germany", "Europe", 3426000],
      ["Mexico City", "Mexico" ,"America", 21200000]]
for i in range(len(data)):
    world.setdefault(data[i][0],data[i][1:])
    
# 1. 전체 데이터 출력
def print_dict(data) :
    for index, (key,value) in enumerate(data.items()):
        print(f'[{index+1}] {key} : {value}')

while True :
    menu=int(input("메뉴를 입력하세요 : "))
    if menu==1 :
        print_dict(world)
    if menu==2 :
        # 2. 수도 이름 오름차순 출력
        sorted_dict=dict(sorted(world.items(), key=lambda x: x[0]))
        for index, (key,value) in enumerate(sorted_dict.items()):
            print(f'[{index+1}] {key:<12} : {value[0]:<15} {value[1]:9} {int(value[-1]):>13,}')

    if menu==3 :
        # 3. 모든 도시의 인구수 내림차순 출력
        sorted_dict=dict(sorted(world.items(), key=lambda x: x[1][-1], reverse=True))
        for index, (key,value) in enumerate(sorted_dict.items()):
            print(f'{key:<12} :  {int(value[-1]):>13,}')
    if menu==4 :   
        # 4. 특정 도시의 정보 출력
        sort_str=input("출력할 도시 이름을 입력하세요 : ")
        if sort_str not in world.keys():
            print(f"도시이름 : {sort_str}은 key에 없습니다.")
        else : 
            print(f"도시이름 : {sort_str}")
            print(f"국가 : {world[sort_str][0]}, 대륙 : {world[sort_str][1]}, 인구수 : {world[sort_str][-1]:,}")
    if menu==5:
        # 5. 대륙별 인구수 계산 및 출력
        sort_str = input("대륙 이름을 입력하세요(Asia, Europe, America) : ")
        for key, value in world.items():
            if value[1] == sort_str:
                print(f"{key} : {value[-1]:,}")
        print(f"{sort_str} 전체 인구수 : {sum(value[-1] for key, value in world.items() if value[1] == sort_str):,}")
    if menu==6 :
        print('프로그램을 종료합니다.')
        break