using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    class Program
    {
        static void Main(string[] args)
        {
            var text =string.Empty;
            try
            {
                using (StreamReader strem = new StreamReader("D:/INPUT.txt"))
                {
                    text += strem.ReadToEnd();
                    if (text.Length > 100)
                    {
                        text = text.Substring(0, 99);
                    }

                }
            }
            catch (Exception e)
            {
                Console.WriteLine("The process failed: {0}", e.ToString());
            }
            var theLongest = string.Empty;
            var theExisting = string.Empty;
            try
            {
                for (var i = 0; i <= text.Length; i++)
                {
                    if (i != text.Length && (int.Parse(text[i].ToString()) != 0))
                    {
                        theExisting += text[i];
                    }
                    else
                    {
                        if (theLongest != null && theExisting != null)
                        {
                            theLongest = theLongest.Length < theExisting.Length ? theExisting : theLongest;
                            theExisting = string.Empty;
                        }
                        else if (theLongest == null && theExisting != null)
                        {
                            theLongest = theExisting;
                            theExisting = string.Empty;
                        }
                    }
                }
            }
            catch
            {
                Console.WriteLine("sorry but in the file 'INPUT.txt' must be only 0 and 1");
            }
            
            var path = "D:/OUTPUT.txt";
            if (File.Exists(path))
            {
                File.Delete(path);
            }
            using (StreamWriter sw = new StreamWriter(path))
            {
                sw.WriteLine(theLongest);
            }

        }
    }
}
