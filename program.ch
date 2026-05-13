using Lab._6;
using System;


namespace Lab._6
{

    
        class Program
        {
            static void Main(string[] args)
            {
                
                Console.OutputEncoding = System.Text.Encoding.UTF8;

                TextContainer myText = new TextContainer();
                bool running = true;

                while (running)
                {
                    Console.WriteLine("\n--- TEXT EDITOR MENU (Variant 14) ---");
                    Console.WriteLine("1. Add a line");
                    Console.WriteLine("2. Remove duplicates");
                    Console.WriteLine("3. Show text and statistics");
                    Console.WriteLine("4. Clear all text");
                    Console.WriteLine("0. Exit");
                    Console.Write("Enter your choice: ");

                    string choice = Console.ReadLine();

                    switch (choice)
                    {
                        case "1":
                            Console.Write("Enter text: ");
                            string input = Console.ReadLine();
                            myText.AddLine(input);
                            break;

                        case "2":
                            myText.RemoveDuplicateLines();
                            Console.WriteLine(">> Duplicates removed successfully.");
                            break;

                        case "3":
                            Console.WriteLine("\n--- Current Text Content ---");
                            foreach (var line in myText.GetLines())
                            {
                                Console.WriteLine($"> {line.Content}");
                            }
                            Console.WriteLine("-----------------------------");
                            Console.WriteLine($"Total characters: {myText.GetTotalLength()}");
                            break;

                        case "4":
                            myText.Clear();
                            Console.WriteLine(">> Text cleared.");
                            break;

                        case "0":
                            running = false;
                            Console.WriteLine("Exiting program...");
                            break;

                        default:
                            Console.WriteLine("Error: Invalid choice. Please try again.");
                            break;
                    }
                }
            }
        }
    }
