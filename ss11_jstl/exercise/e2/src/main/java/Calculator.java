public class Calculator {
    public static double calculator(double fo, String o, double so) throws DivisionException {
        double result = 0;
        switch (o) {
            case "Addition":
                result = fo + so;
                break;
            case  "Subtraction":
                result = fo - so;
                break;
            case  "Multiplication":
                result = fo * so;
                break;
            case  "Division":
                if (so == 0) {
                    throw new DivisionException("Can no divide to 0");
                }
                result = fo/so;
                break;

        }
        return result;
    }
}
