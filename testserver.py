import socket
import threading

def send_raw_request():
    # Create a TCP/IP socket
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    # Connect to the server
    server_address = ('127.0.0.1', 80)
    sock.connect(server_address)
    
    try:
        # Send the raw HTTP GET request
        request = "GET /tmp/tmpuxo56cwu HTTP/1.1\r\nHost: localhost\r\nUser-Agent: python-requests/2.32.3\r\nAccept-Encoding: gzip, deflate, zstd\r\nAccept: */*\r\nConnection: keep-alive\r\n\r\n"
        sock.sendall(request.encode())
        
        # Receive and print the response
        response = sock.recv(1024)
        print(response.decode())
        
    finally:
        # Close the socket
        sock.close()

# Create a list to hold the threads
threads = []

# Number of concurrent requests
num_requests = 10

# Launch multiple threads to send concurrent requests
for i in range(num_requests):
    t = threading.Thread(target=send_raw_request)
    t.start()
    threads.append(t)

# Wait for all threads to finish
for t in threads:
    t.join()

