package liftbot;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.JLabel;
import java.awt.Toolkit;
import javax.swing.JButton;
import javax.swing.SwingConstants;
import java.awt.Font;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JCheckBoxMenuItem;

public class LiftBot {

	private JFrame frmLiftbotCalculator;
	private JTextField balloonMassField;
	private JTextField payloadMassField;
	private JTextField gasConstantField;
	private JTextField molarMassField;
	private JTextField launchPressureField;
	private JTextField launchTemperatureField;
	private JTextField initialForceField;
	private JTextField launchBackpressureField;
	private JTextField altitudePressureField;
	private JTextField altitudeTemperatureField;
	private JTextField targetForceField;
	private JTextField altitudeBackpressureField;
	private JTextField fillVolumeField;
	private JTextField targetAltitudeVolumeField;
	private JTextField targetVolumeField;
	private JTextField discrepancyField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					LiftBot window = new LiftBot();
					window.frmLiftbotCalculator.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public LiftBot() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmLiftbotCalculator = new JFrame();
		frmLiftbotCalculator.setResizable(false);
		frmLiftbotCalculator.setIconImage(Toolkit.getDefaultToolkit().getImage(LiftBot.class.getResource("/liftbot/res/icon.png")));
		frmLiftbotCalculator.setTitle("LiftBot Calculator");
		frmLiftbotCalculator.setBounds(100, 100, 523, 337);
		frmLiftbotCalculator.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmLiftbotCalculator.getContentPane().setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Balloon Mass (kg)");
		lblNewLabel.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblNewLabel.setBounds(10, 11, 117, 27);
		frmLiftbotCalculator.getContentPane().add(lblNewLabel);
		
		balloonMassField = new JTextField();
		balloonMassField.setToolTipText("Mass of the balloon, in kilograms");
		balloonMassField.setBounds(152, 11, 88, 20);
		frmLiftbotCalculator.getContentPane().add(balloonMassField);
		balloonMassField.setColumns(10);
		
		JLabel lblPayloadMasskg = new JLabel("Payload Mass (kg)");
		lblPayloadMasskg.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblPayloadMasskg.setBounds(10, 41, 117, 27);
		frmLiftbotCalculator.getContentPane().add(lblPayloadMasskg);
		
		payloadMassField = new JTextField();
		payloadMassField.setToolTipText("Mass of all attached payloads and flight string, in kg");
		payloadMassField.setColumns(10);
		payloadMassField.setBounds(152, 42, 88, 20);
		frmLiftbotCalculator.getContentPane().add(payloadMassField);
		
		JLabel lblLiftingGas = new JLabel("R  (J/kg K)");
		lblLiftingGas.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblLiftingGas.setBounds(10, 73, 117, 27);
		frmLiftbotCalculator.getContentPane().add(lblLiftingGas);
		
		gasConstantField = new JTextField();
		gasConstantField.setToolTipText("Gas constant of the lift gas. Use 4124 for hydrogen gas.");
		gasConstantField.setColumns(10);
		gasConstantField.setBounds(152, 74, 88, 20);
		frmLiftbotCalculator.getContentPane().add(gasConstantField);
		
		JLabel lblMolarMasskgmol = new JLabel("Molar Mass (kg/mol)");
		lblMolarMasskgmol.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblMolarMasskgmol.setBounds(10, 104, 117, 27);
		frmLiftbotCalculator.getContentPane().add(lblMolarMasskgmol);
		
		molarMassField = new JTextField();
		molarMassField.setToolTipText("The molar mass of the lift gas. Use .00201 for hydrogen.");
		molarMassField.setColumns(10);
		molarMassField.setBounds(152, 105, 88, 20);
		frmLiftbotCalculator.getContentPane().add(molarMassField);
		
		JLabel lblLaunchPressurepa = new JLabel("Launch Pressure (Pa)");
		lblLaunchPressurepa.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblLaunchPressurepa.setBounds(10, 135, 117, 27);
		frmLiftbotCalculator.getContentPane().add(lblLaunchPressurepa);
		
		launchPressureField = new JTextField();
		launchPressureField.setToolTipText("The barometric pressure on the ground at launch. Use 101300 for STP.");
		launchPressureField.setColumns(10);
		launchPressureField.setBounds(152, 136, 88, 20);
		frmLiftbotCalculator.getContentPane().add(launchPressureField);
		
		JLabel lblLaunchTemperaturek = new JLabel("Launch Temperature (K)");
		lblLaunchTemperaturek.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblLaunchTemperaturek.setBounds(10, 165, 132, 27);
		frmLiftbotCalculator.getContentPane().add(lblLaunchTemperaturek);
		
		launchTemperatureField = new JTextField();
		launchTemperatureField.setToolTipText("Temperature at the launch point. Add 273 to the Celsius temperature to obtain the temperature in Kelvins.");
		launchTemperatureField.setColumns(10);
		launchTemperatureField.setBounds(152, 166, 88, 20);
		frmLiftbotCalculator.getContentPane().add(launchTemperatureField);
		
		JLabel lblInitialForcekg = new JLabel("Initial Force (kg)");
		lblInitialForcekg.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblInitialForcekg.setBounds(10, 194, 117, 27);
		frmLiftbotCalculator.getContentPane().add(lblInitialForcekg);
		
		initialForceField = new JTextField();
		initialForceField.setToolTipText("Desired initial upwards force on the balloon, in excess of gravity.");
		initialForceField.setColumns(10);
		initialForceField.setBounds(152, 195, 88, 20);
		frmLiftbotCalculator.getContentPane().add(initialForceField);
		
		JLabel lblLaunchBackpressurepa = new JLabel("Launch Backpressure (Pa)");
		lblLaunchBackpressurepa.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblLaunchBackpressurepa.setBounds(10, 223, 132, 27);
		frmLiftbotCalculator.getContentPane().add(lblLaunchBackpressurepa);
		
		launchBackpressureField = new JTextField();
		launchBackpressureField.setToolTipText("Backpressure in the balloon at the launch point. Assume 0 if you're not sure.");
		launchBackpressureField.setColumns(10);
		launchBackpressureField.setBounds(152, 226, 88, 20);
		frmLiftbotCalculator.getContentPane().add(launchBackpressureField);
		
		JLabel lblAltitudePressurepa = new JLabel("Altitude Pressure (Pa)");
		lblAltitudePressurepa.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblAltitudePressurepa.setBounds(10, 250, 137, 27);
		frmLiftbotCalculator.getContentPane().add(lblAltitudePressurepa);
		
		altitudePressureField = new JTextField();
		altitudePressureField.setToolTipText("Pressure of the atmosphere at your desired altitude. Look up on Wolfram|Alpha if unsure.");
		altitudePressureField.setColumns(10);
		altitudePressureField.setBounds(152, 257, 88, 20);
		frmLiftbotCalculator.getContentPane().add(altitudePressureField);
		
		JLabel lblAltitudeTemperaturek = new JLabel("Altitude Temperature (K)");
		lblAltitudeTemperaturek.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblAltitudeTemperaturek.setBounds(264, 11, 137, 27);
		frmLiftbotCalculator.getContentPane().add(lblAltitudeTemperaturek);
		
		altitudeTemperatureField = new JTextField();
		altitudeTemperatureField.setToolTipText("Temperature of the atmosphere at altitude. Look up on Wolfram|Alpha if unsure.");
		altitudeTemperatureField.setColumns(10);
		altitudeTemperatureField.setBounds(419, 11, 88, 20);
		frmLiftbotCalculator.getContentPane().add(altitudeTemperatureField);
		
		JLabel lblTargetForcekg = new JLabel("Target Force (kg)");
		lblTargetForcekg.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblTargetForcekg.setBounds(264, 43, 137, 27);
		frmLiftbotCalculator.getContentPane().add(lblTargetForcekg);
		
		targetForceField = new JTextField();
		targetForceField.setToolTipText("Desired net upwards force at the target altitude. Use 0 for a neutrally-buoyant balloon.");
		targetForceField.setColumns(10);
		targetForceField.setBounds(419, 43, 88, 20);
		frmLiftbotCalculator.getContentPane().add(targetForceField);
		
		JLabel lblAltitudeBackpressurepa = new JLabel("Altitude Backpressure (Pa)");
		lblAltitudeBackpressurepa.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblAltitudeBackpressurepa.setBounds(264, 74, 137, 27);
		frmLiftbotCalculator.getContentPane().add(lblAltitudeBackpressurepa);
		
		altitudeBackpressureField = new JTextField();
		altitudeBackpressureField.setToolTipText("Backpressure of the balloon at altitude. Calculate using our bp tool from GitHub or assume 0 if you're not sure.");
		altitudeBackpressureField.setColumns(10);
		altitudeBackpressureField.setBounds(419, 74, 88, 20);
		frmLiftbotCalculator.getContentPane().add(altitudeBackpressureField);
		
		JButton btnNewButton = new JButton("Calculate");
		btnNewButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseReleased(MouseEvent arg0) {
				
				/* Run validation on user input to make sure all fields are full */
				
				if(Validations.isEmpty(balloonMassField) == 1 || Validations.isEmpty(payloadMassField) == 1 || Validations.isEmpty(gasConstantField) == 1 
						|| Validations.isEmpty(molarMassField) == 1 || Validations.isEmpty(balloonMassField) == 1
						|| Validations.isEmpty(launchPressureField) == 1 || Validations.isEmpty(launchTemperatureField) == 1
						|| Validations.isEmpty(launchBackpressureField) == 1 || Validations.isEmpty(initialForceField) == 1 
						|| Validations.isEmpty(altitudePressureField) == 1 || Validations.isEmpty(altitudeTemperatureField) == 1
						|| Validations.isEmpty(altitudeBackpressureField) == 1 || Validations.isEmpty(targetForceField) == 1){
					
					/* Display an error message */ 
					
					JOptionPane.showMessageDialog(null, "All fields must be completed to calculate lift.", "Calculation Error", JOptionPane.ERROR_MESSAGE);
					
					
				}
				
				
				else{
					/* Get data values from user-inputed text fields and check for numericality. */
					
					try{
						Double.parseDouble(balloonMassField.getText());
						Double.parseDouble(payloadMassField.getText());
						Double.parseDouble(gasConstantField.getText());
						Double.parseDouble(molarMassField.getText());
						Double.parseDouble(launchPressureField.getText());
						Double.parseDouble(launchTemperatureField.getText());
						Double.parseDouble(launchBackpressureField.getText());
						Double.parseDouble(initialForceField.getText());
						Double.parseDouble(altitudePressureField.getText());
						Double.parseDouble(altitudeTemperatureField.getText());
						Double.parseDouble(altitudeBackpressureField.getText());
						Double.parseDouble(targetForceField.getText());
					} catch(NumberFormatException e) {
						/* Display an error dialog if the system throws an exception. */
						JOptionPane.showMessageDialog(null, "All fields must be completed with numerical values.", "Calculation Error", JOptionPane.ERROR_MESSAGE);
					}
					
					double balloonMass = Double.parseDouble(balloonMassField.getText());
					double payloadMass = Double.parseDouble(payloadMassField.getText());
					double rAir = 286.9;
					double rGas = Double.parseDouble(gasConstantField.getText());
					double molarMass = Double.parseDouble(molarMassField.getText());
					double launchPressure = Double.parseDouble(launchPressureField.getText());
					double launchTemperature = Double.parseDouble(launchTemperatureField.getText());
					double launchBackpressure = Double.parseDouble(launchBackpressureField.getText());
					double launchForce = Double.parseDouble(initialForceField.getText());
					double altPressure = Double.parseDouble(altitudePressureField.getText());
					double altTemperature = Double.parseDouble(altitudeTemperatureField.getText());
					double altBackpressure = Double.parseDouble(altitudeBackpressureField.getText());
					double altForce = Double.parseDouble(targetForceField.getText());
					
					/* Put values through derived algorithm */
					
					altPressure = altPressure + altBackpressure;
					launchPressure = launchPressure + launchBackpressure;
					
					double launchAirDensity = Formulas.density(launchPressure, rAir, launchTemperature);
					double launchGasDensity = Formulas.density(launchPressure, rGas, launchTemperature);
					double launchVolume = Formulas.volume(launchForce, balloonMass, payloadMass, molarMass, launchGasDensity, launchAirDensity);
					double altAirDensity = Formulas.density(altPressure, rAir, altTemperature);
					double altGasDensity = Formulas.density(altPressure, rGas, altTemperature);
					double altVolume = Formulas.volume(altForce, balloonMass, payloadMass, molarMass, altGasDensity, altAirDensity);
					double stpVolume = Formulas.convertToSTP(altVolume, altTemperature, altPressure);
					double discrepancy = Formulas.volumeChange(launchVolume, stpVolume);
					
					/* Update results fields with derived values */
					
					fillVolumeField.setText(String.valueOf(Formulas.round(launchVolume, 4)));
					targetAltitudeVolumeField.setText(String.valueOf(Formulas.round(altVolume, 4)));
					targetVolumeField.setText(String.valueOf(Formulas.round(stpVolume, 4)));
					discrepancyField.setText(String.valueOf(Formulas.round(discrepancy, 4)));
				}
				
			}
		});
		btnNewButton.setToolTipText("Calculate using inputted values");
		btnNewButton.setBounds(264, 254, 243, 23);
		frmLiftbotCalculator.getContentPane().add(btnNewButton);
		
		JLabel lblNewLabel_1 = new JLabel("RESULTS");
		lblNewLabel_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_1.setBounds(264, 110, 243, 14);
		frmLiftbotCalculator.getContentPane().add(lblNewLabel_1);
		
		fillVolumeField = new JTextField();
		fillVolumeField.setEditable(false);
		fillVolumeField.setToolTipText("Volume of lifting gas to fill balloon with to attain specified initial force.");
		fillVolumeField.setColumns(10);
		fillVolumeField.setBounds(419, 135, 88, 20);
		frmLiftbotCalculator.getContentPane().add(fillVolumeField);
		
		JLabel lblFillVolumem = new JLabel("Fill Volume (m^3)");
		lblFillVolumem.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblFillVolumem.setBounds(264, 135, 137, 27);
		frmLiftbotCalculator.getContentPane().add(lblFillVolumem);
		
		JLabel lblTargetAltitudeVolume = new JLabel("Target Altitude Volume (m^3)");
		lblTargetAltitudeVolume.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblTargetAltitudeVolume.setBounds(264, 164, 156, 27);
		frmLiftbotCalculator.getContentPane().add(lblTargetAltitudeVolume);
		
		targetAltitudeVolumeField = new JTextField();
		targetAltitudeVolumeField.setEditable(false);
		targetAltitudeVolumeField.setToolTipText("Ideal amount of gas in balloon at target altitude to attain target force.");
		targetAltitudeVolumeField.setColumns(10);
		targetAltitudeVolumeField.setBounds(419, 164, 88, 20);
		frmLiftbotCalculator.getContentPane().add(targetAltitudeVolumeField);
		
		targetVolumeField = new JTextField();
		targetVolumeField.setEditable(false);
		targetVolumeField.setToolTipText("Target Altitude Volume converted to STP standard cubic meters for comparison purposes.");
		targetVolumeField.setColumns(10);
		targetVolumeField.setBounds(419, 195, 88, 20);
		frmLiftbotCalculator.getContentPane().add(targetVolumeField);
		
		JLabel lblTargetVolumestd = new JLabel("Target Volume (std m^3)");
		lblTargetVolumestd.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblTargetVolumestd.setBounds(264, 193, 137, 27);
		frmLiftbotCalculator.getContentPane().add(lblTargetVolumestd);
		
		JLabel lblDiscrepancym = new JLabel("Discrepancy (m^3)");
		lblDiscrepancym.setFont(new Font("Segoe UI", Font.PLAIN, 11));
		lblDiscrepancym.setBounds(264, 220, 137, 27);
		frmLiftbotCalculator.getContentPane().add(lblDiscrepancym);
		
		discrepancyField = new JTextField();
		discrepancyField.setEditable(false);
		discrepancyField.setToolTipText("Difference between fill volume and target volume. If negative, the balloon must lose this amout of gas over the duration of the flight.");
		discrepancyField.setColumns(10);
		discrepancyField.setBounds(419, 226, 88, 20);
		frmLiftbotCalculator.getContentPane().add(discrepancyField);
		
		JMenuBar menuBar = new JMenuBar();
		frmLiftbotCalculator.setJMenuBar(menuBar);
		
		JMenu mnNewMenu = new JMenu("Help");
		menuBar.add(mnNewMenu);
		
		JMenuItem aboutMenuItem = new JMenuItem("About LiftBot");
		aboutMenuItem.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseReleased(MouseEvent arg0) {
				/* Display the About LiftBot dialog... */
				About.main(null); 
			}
		});
		mnNewMenu.add(aboutMenuItem);
		
		JMenuItem mntmLegal = new JMenuItem("Legal");
		mntmLegal.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseReleased(MouseEvent arg0) {
				Legal.main(null);
			}
		});
		mnNewMenu.add(mntmLegal);
	}
}
