package db;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class DB {

	public String path;
	ArrayList<String> packet = new ArrayList<String>();
	public String[] input_arr = new String[packet.size()];
	BufferedReader br = null;

	public String[] run(String path) {

		try {
			br = new BufferedReader(new FileReader(new File(path)));
			String s;

			while ((s = br.readLine()) != null) {
				packet.add(s);
			}
			input_arr = packet.toArray(input_arr);

			br.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}

		return input_arr;

	}

}
