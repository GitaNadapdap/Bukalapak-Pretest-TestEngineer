import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.AndroidElement;
import org.testng.Assert;

import java.net.MalformedURLException;

public class scriptAutomationRegisterTest {
    public  void RegisterTest(AndroidDriver<AndroidElement> driver,
                              String email,
                              String password,
                              String confirmPassword,
                              String name) throws MalformedURLException, InterruptedException {


        MobileElement el1 = (MobileElement) driver.findElementById("com.loginmodule.learning:id/textViewLinkRegister");
        el1.click();
        Thread.sleep(2000);
        MobileElement el2 = (MobileElement) driver.findElementById("com.loginmodule.learning:id/textInputEditTextName");
        el2.sendKeys(name);
        MobileElement el3 = (MobileElement) driver.findElementById("com.loginmodule.learning:id/textInputEditTextEmail");
        el3.sendKeys(email);
        MobileElement el4 = (MobileElement) driver.findElementById("com.loginmodule.learning:id/textInputEditTextPassword");
        el4.sendKeys(password);
        MobileElement el5 = (MobileElement) driver.findElementById("com.loginmodule.learning:id/textInputEditTextConfirmPassword");
        el5.sendKeys(confirmPassword);
        MobileElement el6 = (MobileElement) driver.findElementById("com.loginmodule.learning:id/appCompatButtonRegister");
        el6.click();

        Thread.sleep(5000);
        MobileElement el9 = (MobileElement) driver.findElementById("com.loginmodule.learning:id/appCompatTextViewLoginLink");
        el9.click();

    }
}
