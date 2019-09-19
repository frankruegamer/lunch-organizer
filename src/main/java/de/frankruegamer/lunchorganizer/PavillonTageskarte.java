package de.frankruegamer.lunchorganizer;

import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.PdfTextExtractor;
import de.frankruegamer.lunchorganizer.business.food.Food;
import de.frankruegamer.lunchorganizer.business.food.FoodRepository;
import de.frankruegamer.lunchorganizer.business.restaurant.Restaurant;
import de.frankruegamer.lunchorganizer.business.restaurant.RestaurantRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Component
public class PavillonTageskarte {

	private static final String RESTAURANT_NAME = "Pavillon";

	private final FoodRepository foodRepository;
	private final Restaurant restaurant;

	public PavillonTageskarte(FoodRepository foodRepository, RestaurantRepository restaurantRepository) {
		this.foodRepository = foodRepository;
		restaurant = restaurantRepository.findByName(RESTAURANT_NAME);
	}

	@Bean
	CommandLineRunner commandLineRunner(PavillonTageskarte tageskarte) {
		return args -> tageskarte.reloadTageskarte();
	}

	@Scheduled(cron = "30 9 * * MON-FRI")
	public void reloadTageskarte() throws IOException {
		String fullText = PdfTextExtractor.getTextFromPage(new PdfReader(getUrl()), 1);
		String mainText = trim(fullText);
		List<String> textGroups = group(mainText);
		List<Food> foods = getFoods(textGroups);
	}

	private String trim(String fullText) {
		String threeNewLines = "(?:\\s*\n){3}";
		Pattern pattern = Pattern.compile(".*" + threeNewLines + "(.*)" + threeNewLines + ".*", Pattern.DOTALL);
		Matcher matcher = pattern.matcher(fullText);
		if (matcher.matches()) {
			return matcher.group(1);
		}
		throw new IllegalStateException("No match found");
	}

	private List<String> group(String mainText) {
		String twoNewLines = "(?:\\s*\n){2}\\s*";
		String[] split = mainText.split(twoNewLines);
		return Arrays.asList(split);
	}

	private List<Food> getFoods(List<String> textGroups) {
		return textGroups.stream().map(this::getFood).flatMap(List::stream).collect(Collectors.toList());
	}

	private List<Food> getFood(String str) {
		String oneNewLine = "\\s*\n\\s*";
		String[] split = str.split(oneNewLine);
		for (String line : split) {
			String[] words = line.split("\\s+");
			String lastWord = words[words.length - 1];
			isNonNoun(lastWord);
		}

		return new ArrayList<>();
	}

	private boolean isNonNoun(String word) {
		return !Character.isUpperCase(word.charAt(0));
	}

	private URL getUrl() throws MalformedURLException {
		return new URL(
				"https://www.pavillon-wuerzburg.de/pavillon/images/pavillon/tageskarte/Tageskarte-05.09.2019.pdf");
	}

}
