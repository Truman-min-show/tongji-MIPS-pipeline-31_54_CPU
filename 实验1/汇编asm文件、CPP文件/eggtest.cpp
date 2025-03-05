#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
int main()
{
	int init_floor;
	int init_resistance;

	printf("������¥������");
	scanf("%d", &init_floor);

	printf("��������ˤֵ��");
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

	printf("������%d�Σ�ˤ�鼦��%d�������һ�μ���", result_attempt_cnt, result_broken_cnt);
	printf((result_is_last_broken ? "ˤ��\n" : "û��\n"));
	printf("����¥%d�㣬��¥%d��\n", up_floor, down_floor);
	printf("�����ѷ��ڵ��ܳɱ�Ϊ��0x%x��", cost_little_supply);
	printf("�����ɱ������ڵ��ܳɱ�Ϊ��0x%x", cost_high_laber);
	return 0;
}