#int power(int x, int n) {
#	int i; int result = 1;
#	for (i=1;i<=n;++i) result=result*x;
#		return result;
# } // power()
#
#int main(void) {
#	int x; int n;
#	cin >> x;
#	cin >> n;
#	cout << power(x,n);
#	return 0;
# } // main()