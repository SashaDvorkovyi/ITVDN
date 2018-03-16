using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task2
{
    class Program
    {
        static void Main(string[] args)
        {
            var input = Console.ReadLine();
            int inputInt;
            List<int> a = new List<int>();
            if (int.TryParse(input, out inputInt))
            {
                a = Dividers(inputInt);
            }
            List<List<int>> repet = new List<List<int>>();
            var t = 0;
            for (var i=0; i<a.Count; i++)
            {
                if (i - 1 < 0)
                {
                    repet.Add(new List<int>());
                    repet[t].Add(a[i]);
                }
                else if (a[i] == a[i - 1])
                {
                    repet[t].Add(a[i]);
                }
                else if (a[i] != a[i - 1])
                {
                    t++;
                    repet.Add(new List<int>());
                    repet[t].Add(a[i]);
                }
            }
            for (var i = 0; i < repet.Count; i++)
            {
                for (var j = 1; j < repet[i].Count; j++)
                {
                    repet[i][j] = repet[i][j] * repet[i][j - 1];
                }
            }

            for (var i = 1; i < repet.Count; i++)
            {
                var c = repet[0].Count;
                for (var j = 0; j < repet[i].Count; j++)
                {
                    for (var m = 0; m < c; m++)
                    {
                        repet[0].Add(repet[0][m]* repet[i][j]);
                    }
                    repet[0].Add(repet[i][j]);
                }
            }
            var answer = from x in repet[0]
                         orderby x
                         select x;
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("dividers is:");
            foreach (var item in answer)
            {
                Console.WriteLine(item);
            }
            Console.ResetColor();
            Console.ReadKey();


        }
        public static List<int> Dividers(int number)
        {
            var ansver = new List<int>();
            var value = 2;
            do
            {
                if (number % value == 0)
                {
                    ansver.Add(value);
                    ansver=Dividers(ansver, number / value, value);
                    break;
                }
                else
                {
                    value++;
                }
            }
            while (value <= number);
            return ansver;
        }
        public static List<int> Dividers(List<int> ansver, int number, int value)
        {
            do
            {
                if (number % value == 0)
                {
                    ansver.Add(value);
                    ansver=Dividers(ansver, number / value, value);
                    break;
                }
                else
                {
                    value++;
                }
            }
            while (value <= number);
            return ansver;
        }

    }
    
}
