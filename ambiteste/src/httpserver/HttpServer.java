package aaaaaa;

import java.io.File;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;
import java.io.*;
import java.net.*;
import java.util.StringTokenizer;
import java.util.Date;

public class HttpServer {
    //static constants
    //HttpServer root is the current directory
    static final File WEB_ROOT = new File(".");
    static final String DEFAULT_FILE = "index.jsp";
    static final int PORT = 8080; //default port

    //static variables
    static boolean verbose=false;

    //instance variables
    Socket connect;


    //constructor
    public HttpServer(Socket connect)
    {
        this.connect = connect;
    }


    /**
     * main method creates a new HttpServer instance for each
     * request and starts it running in a separate thread.
     */
    public static void main(String[] args)
    {
        if (args.length > 0)
        {
            if (args[0].equals("-v") || args[0].equals("-verbose"))
            {
                verbose = true; //print status to standard out
            }
            else if (args[0].equals("-?") || args[0].equals("-help"))
            {
                //print instructions to standard out
                String instructions =
                        "usage: java HttpServer [-options]\n\n" +
                                "where options include:\n" +
                                "    -? -help\t print out this message\n" +
                                "    -v -verbose\t turn on verbose mode";

                System.out.println(instructions);
                return;
            }
        }

        try
        {
            ServerSocket serverConnect = new ServerSocket(PORT);
            System.out.println("\nListening for connections on port " +
                    PORT + "...\n");
            while (true) //listen until user halts execution
            {
                HttpServer server = new HttpServer(
                        serverConnect.accept()); //instantiate HttpServer
                if (verbose)
                {
                    System.out.println("Connection opened. (" +
                            new Date() + ")");
                }
                //create new thread
                Thread threadRunner = new Thread(String.valueOf(server));
                threadRunner.start(); //start thread
            }
        }
        catch (IOException e)
        {
            System.err.println("Server error: " + e);
        }
    }


    /**
     * run method services each request in a separate thread.
     */
    public void run()
    {
        BufferedReader in = null;
        PrintWriter out = null;
        BufferedOutputStream dataOut = null;
        String fileRequested = null;

        try
        {
            //get character input stream from client
            in = new BufferedReader(new InputStreamReader(
                    connect.getInputStream()));
            //get character output stream to client (for headers)
            out = new PrintWriter(connect.getOutputStream());
            //get binary output stream to client (for requested data)
            dataOut = new BufferedOutputStream(
                    connect.getOutputStream());

            //get first line of request from client
            String input = in.readLine();
            //create StringTokenizer to parse request
            StringTokenizer parse = new StringTokenizer(input);
            //parse out method
            String method = parse.nextToken().toUpperCase();
            //parse out file requested
            fileRequested = parse.nextToken().toLowerCase();

            //methods other than GET and HEAD are not implemented
            if (!method.equals("GET") && !method.equals("HEAD"))
            {
                if (verbose)
                {
                    System.out.println("501 Not Implemented: " + method +
                            " method.");
                }

                //send Not Implemented message to client
                out.println("HTTP/1.0 501 Not Implemented");
                out.println("Server: Java HTTP Server 1.0");
                out.println("Date: " + new Date());
                out.println("Content-Type: text/html");
                out.println(); //blank line between headers and content
                out.println("<HTML>");
                out.println("<HEAD><TITLE>Not Implemented</TITLE>" +
                        "</HEAD>");
                out.println("<BODY>");
                out.println("<H2>501 Not Implemented: " + method +
                        " method.</H2>");
                out.println("</BODY></HTML>");
                out.flush();

                return;
            }

            //If we get to here, request method is GET or HEAD

            if (fileRequested.endsWith("/"))
            {
                //append default file name to request
                fileRequested += DEFAULT_FILE;
            }

            //create file object
            File file = new File(WEB_ROOT, fileRequested);
            //get length of file
            int fileLength = (int)file.length();

            //get the file's MIME content type
            String content = getContentType(fileRequested);

            //if request is a GET, send the file content
            if (method.equals("GET"))
            {
                FileInputStream fileIn = null;
                //create byte array to store file data
                byte[] fileData = new byte[fileLength];

                try
                {
                    //open input stream from file
                    fileIn = new FileInputStream(file);
                    //read file into byte array
                    fileIn.read(fileData);
                }
                finally
                {
                    close(fileIn); //close file input stream
                }

                //send HTTP headers
                out.println("HTTP/1.0 200 OK");
                out.println("Server: Java HTTP Server 1.0");
                out.println("Date: " + new Date());
                out.println("Content-type: " + content);
                out.println("Content-length: " + file.length());
                out.println(); //blank line between headers and content
                out.flush(); //flush character output stream buffer

                dataOut.write(fileData,0,fileLength); //write file
                dataOut.flush(); //flush binary output stream buffer
            }

            if (verbose)
            {
                System.out.println("File " + fileRequested +
                        " of type " + content + " returned.");
            }
        }
        catch (FileNotFoundException fnfe)
        {
            //inform client file doesn't exist
            fileNotFound(out, fileRequested);
        }
        catch (IOException ioe)
        {
            System.err.println("Server Error: " + ioe);
        }
        finally
        {
            close(in); //close character input stream
            close(out); //close character output stream
            close(dataOut); //close binary output stream
            close(connect); //close socket connection

            if (verbose)
            {
                System.out.println("Connection closed.\n");
            }
        }
    }


    /**
     * fileNotFound informs client that requested file does not
     * exist.
     *
     * @param out Client output stream
     * @param file File requested by client
     */
    private void fileNotFound(PrintWriter out, String file)
    {
        //send file not found HTTP headers
        out.println("HTTP/1.0 404 File Not Found");
        out.println("Server: Java HTTP Server 1.0");
        out.println("Date: " + new Date());
        out.println("Content-Type: text/html");
        out.println();
        out.println("<HTML>");
        out.println("<HEAD><TITLE>File Not Found</TITLE>" +
                "</HEAD>");
        out.println("<BODY>");
        out.println("<H2>404 File Not Found: " + file + "</H2>");
        out.println("</BODY>");
        out.println("</HTML>");
        out.flush();

        if (verbose)
        {
            System.out.println("404 File Not Found: " + file);
        }
    }


    /**
     * getContentType returns the proper MIME content type
     * according to the requested file's extension.
     *
     * @param fileRequested File requested by client
     */
    private String getContentType(String fileRequested)
    {
        if (fileRequested.endsWith(".htm") ||
                fileRequested.endsWith(".html"))
        {
            return "text/html";
        }
        else if (fileRequested.endsWith(".gif"))
        {
            return "image/gif";
        }
        else if (fileRequested.endsWith(".jpg") ||
                fileRequested.endsWith(".jpeg"))
        {
            return "image/jpeg";
        }
        else if (fileRequested.endsWith(".class") ||
                fileRequested.endsWith(".jar"))
        {
            return "applicaton/octet-stream";
        }
        else
        {
            return "text/plain";
        }
    }


    /**
     * close method closes the given stream.
     *
     * @param stream
     */
    public void close(Object stream)
    {
        if (stream == null)
            return;

        try
        {
            if (stream instanceof Reader)
            {
                ((Reader)stream).close();
            }
            else if (stream instanceof Writer)
            {
                ((Writer)stream).close();
            }
            else if (stream instanceof InputStream)
            {
                ((InputStream)stream).close();
            }
            else if (stream instanceof OutputStream)
            {
                ((OutputStream)stream).close();
            }
            else if (stream instanceof Socket)
            {
                ((Socket)stream).close();
            }
            else
            {
                System.err.println("Unable to close object: " + stream);
            }
        }
        catch (Exception e)
        {
            System.err.println("Error closing stream: " + e);
        }
    }
}

