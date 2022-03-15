package kr.co.marking;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Test;

public class RandomTest {

	@Test
	public void test() {
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@$?";
		String returnVal = RandomStringUtils.random( 10, 0, characters.length(), false, false, characters.toCharArray(), new SecureRandom() );

		System.out.println(returnVal);
	}
	
	@Test
	public void test2() {
		List<String> list = new ArrayList<>();
		Random random = new Random();
		String newPassword ="";
		
		for (int i = 0; i < 7; i++) {
			list.add(RandomStringUtils.randomAlphanumeric(1).toLowerCase());
		}
		list.add(Integer.toString(random.nextInt(10)));
		for (int i = 0; i < 2; i++) {
			int j = 0;
			while (true) {

				j = random.nextInt(65);

				if (j == 33 || j == 35 || j == 63 || (j == 64)) {
					break;
				}
			}
			list.add(Character.toString((char) j));
		}
		Collections.shuffle(list);
		
		for (int i = 0; i < list.size(); i++) {
			newPassword += list.get(i);
		}
		System.out.println(newPassword);
	}

}
