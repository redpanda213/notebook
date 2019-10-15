```
public class MyDemo{
    public static void main(String[] args) throws Exception{
		Map<String, Integer> words = new HashMap<String,Integer>();
        BufferedReader br = new BufferedReader(new FileReader("d:/a.txt"));
        String line = br.readline();
        while(line!=null){
            Stringp[] wds = line.split(" ");
            for(String wds : wds){
                if(words.containKey(wd)){
                    words.put(wds,words.get(wd)+1);
                }else{
                    words.put(wds,1);
                }
            }
            line=br.readline();
        }
        br.close();
        words.forEach((k,v)->{
            System.out.println(k+":"+v);
        });
    
    } 
}
```

