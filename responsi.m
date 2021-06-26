opts = detectImportOptions('Real estate valuation data set.csv');
opts.SelectedVariableNames = {'X2HouseAge','X3DistanceToTheNearestMRTStation','X4NumberOfConvenienceStores','YHousePriceOfUnitArea'};
data = readmatrix('Real estate valuation data set.csv',opts);

x = [data(1:50,:)];%data rating kecocokan dari masing-masing alternatif
k = [0,0,1,0];%atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan  0= atribut biaya
w = [3,5,4,1];%Nilai bobot tiap kriteria (1= sangat buruk, 2=buruk, 3= cukup, 4= tinggi, 5= sangat tinggi) 

%tahapan pertama, perbaikan bobot
[m n]=size (x); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(x(i,:).^w);
end;

%tahapan ketiga, proses perangkingan
V=S/sum(S);
[Y,IND] = sort(V);


%mencari alternatif terbaik
maks = max(V);

hasil = num2str(maks);
hasil2 = num2str(IND(50));
hasil3 = num2str(IND(46:50));

disp('Real estate yang terbaik dan cocok untuk investasi panjang adalah real estate ke = '),disp(hasil2)
disp('dengan nilai = '),disp(hasil)
disp('Real estate terbaik 5 besar (terbaik 5 - terbaik 1) = '),disp(hasil3)