#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
int main()
{
	int init_floor;
	int init_resistance;

	printf("请输入楼层数：");
	scanf("%d", &init_floor);

	printf("请输入耐摔值：");
	scanf("%d", &init_resistance);

	int result_attempt_cnt = 0;
	int result_broken_cnt = 0;
	bool result_is_last_broken = 0;
	int up_floor = 0, down_floor=0,last_try_floor=(init_floor+1)/2;
	int l = 0, r = init_floor;
	int cost_little_supply = 0, cost_high_laber = 0;
	while (l < r) {

		result_attempt_cnt++;

		int mid = (l + r + 1) / 2;
		if (mid > last_try_floor)
			up_floor += (mid - last_try_floor);
		else
			down_floor += (last_try_floor - mid);

		if (mid > init_resistance) {
			result_is_last_broken = 1;
			r = mid - 1;
			result_broken_cnt++;
		}
		else {
			result_is_last_broken = 0;
			l = mid;
		}
		last_try_floor = mid;
	}

	cost_little_supply = 2 * up_floor + 1 * down_floor + 4 * result_broken_cnt;
	cost_high_laber= 4 * up_floor + 1 * down_floor + 2 * result_broken_cnt;

	printf("共尝试%d次，摔碎鸡蛋%d个，最后一次鸡蛋", result_attempt_cnt, result_broken_cnt);
	printf((result_is_last_broken ? "摔碎\n" : "没碎\n"));
	printf("共上楼%d层，下楼%d层\n", up_floor, down_floor);
	printf("物质匮乏期的总成本为：0x%x，", cost_little_supply);
	printf("人力成本增长期的总成本为：0x%x", cost_high_laber);
	return 0;
}