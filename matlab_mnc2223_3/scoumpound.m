n = 50;
x = 0.005;
fprintf("   n/Alg           **Alg1**                  **Alg2**                **Alg3**                **Alg4**                **Alg5**\n");
[alg1, alg2, alg3, alg4, alg5]=fcompound(n,x);
fprintf("%7d         %14.7e          %14.7e          %14.7e         %14.7e           %14.7e\n", n,alg1,alg2,alg3,alg4,alg5);
n = 100;
while(n<=1000000)
[alg1, alg2, alg3, alg4, alg5]=fcompound(n,x);
fprintf("%7d         %14.7e          %14.7e          %14.7e         %14.7e           %14.7e\n", n,alg1,alg2,alg3,alg4,alg5);
n = 10*n;
end

fprintf("e^x = %14.7e\n", exp(x));

