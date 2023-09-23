def shellDo(String command) {
    def output = []
    def processBuilder = new ProcessBuilder("/bin/bash", "-c", command)
    def process = processBuilder.start()
    def reader = new BufferedReader(new InputStreamReader(process.getInputStream()))
    String line

    while ((line = reader.readLine()) != null) {
        output.add(line)
    }

    process.waitFor()

    return output
}

 

def x = shellDo("ls /var/jenkins_home/infra/")

 

x.each { println it }
