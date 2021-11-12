import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.JButton;
import java.awt.Font;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class CadastrarRevista extends JFrame {

	private JPanel contentPane;
	private JTextField tituloRevista;
	private JTextField orgRevista;
	private JTextField anoLancamento;
	private JTextField nroRevista;
	private JTextField volRevista;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					CadastrarRevista frame = new CadastrarRevista();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public CadastrarRevista() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 385, 238);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		
		JLabel lblNewLabel = new JLabel("Titulo da Revista:");
		
		tituloRevista = new JTextField();
		tituloRevista.setColumns(10);
		
		JLabel lblNewLabel_1 = new JLabel("Org:");
		
		orgRevista = new JTextField();
		orgRevista.setColumns(10);
		
		JLabel lblNewLabel_2 = new JLabel("Ano:");
		
		anoLancamento = new JTextField();
		anoLancamento.setColumns(10);
		
		JLabel lblNewLabel_3 = new JLabel("Nro.:");
		
		nroRevista = new JTextField();
		nroRevista.setColumns(10);
		
		JLabel lblNewLabel_4 = new JLabel("Vol.:");
		
		volRevista = new JTextField();
		volRevista.setColumns(10);
		
		JButton btnIncluir = new JButton("Incluir");
		btnIncluir.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					cadastrarRevista();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		
		JButton btnListagemRevista = new JButton("Listagem");
		btnListagemRevista.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Listagem listagem = new Listagem();
				listagem.setVisible(true);
				setVisible(false);
			}
		});
		
		JButton btnLivros = new JButton("Livros");
		btnLivros.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				CadastrarLivro cadastroLivro = new CadastrarLivro();
				cadastroLivro.setVisible(true);
				setVisible(false);
			}
		});
		
		JLabel lblNewLabel_5 = new JLabel("Revistas");
		lblNewLabel_5.setFont(new Font("Tahoma", Font.PLAIN, 20));
		GroupLayout gl_contentPane = new GroupLayout(contentPane);
		gl_contentPane.setHorizontalGroup(
			gl_contentPane.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_contentPane.createSequentialGroup()
					.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
						.addGroup(gl_contentPane.createSequentialGroup()
							.addContainerGap()
							.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
								.addGroup(gl_contentPane.createSequentialGroup()
									.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING)
										.addComponent(lblNewLabel)
										.addComponent(lblNewLabel_1)
										.addGroup(gl_contentPane.createSequentialGroup()
											.addComponent(lblNewLabel_4)
											.addPreferredGap(ComponentPlacement.RELATED)
											.addComponent(volRevista, GroupLayout.PREFERRED_SIZE, 68, GroupLayout.PREFERRED_SIZE)))
									.addGap(18)
									.addGroup(gl_contentPane.createParallelGroup(Alignment.LEADING, false)
										.addGroup(gl_contentPane.createSequentialGroup()
											.addComponent(lblNewLabel_3)
											.addPreferredGap(ComponentPlacement.RELATED)
											.addComponent(nroRevista, GroupLayout.PREFERRED_SIZE, 74, GroupLayout.PREFERRED_SIZE)
											.addGap(18)
											.addComponent(lblNewLabel_2)
											.addPreferredGap(ComponentPlacement.RELATED)
											.addComponent(anoLancamento, GroupLayout.PREFERRED_SIZE, 74, GroupLayout.PREFERRED_SIZE))
										.addComponent(orgRevista)
										.addComponent(tituloRevista)))
								.addGroup(gl_contentPane.createSequentialGroup()
									.addComponent(btnIncluir)
									.addGap(18)
									.addComponent(btnLivros)
									.addGap(18)
									.addComponent(btnListagemRevista))))
						.addGroup(gl_contentPane.createSequentialGroup()
							.addGap(143)
							.addComponent(lblNewLabel_5)))
					.addContainerGap(15, Short.MAX_VALUE))
		);
		gl_contentPane.setVerticalGroup(
			gl_contentPane.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_contentPane.createSequentialGroup()
					.addGap(4)
					.addComponent(lblNewLabel_5)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(gl_contentPane.createParallelGroup(Alignment.TRAILING)
						.addComponent(lblNewLabel)
						.addComponent(tituloRevista, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNewLabel_1)
						.addComponent(orgRevista, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addGap(18)
					.addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNewLabel_4)
						.addComponent(volRevista, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
						.addComponent(lblNewLabel_3)
						.addComponent(nroRevista, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
						.addComponent(lblNewLabel_2)
						.addComponent(anoLancamento, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addPreferredGap(ComponentPlacement.RELATED, 28, Short.MAX_VALUE)
					.addGroup(gl_contentPane.createParallelGroup(Alignment.BASELINE)
						.addComponent(btnIncluir)
						.addComponent(btnLivros)
						.addComponent(btnListagemRevista))
					.addGap(25))
		);
		contentPane.setLayout(gl_contentPane);
	}
	
	public void cadastrarRevista() throws Exception{
		try {
			String org, titulo, nro, vol, ano;
			
			org = orgRevista.getText();
			titulo =  tituloRevista.getText();
			nro = nroRevista.getText();
			vol = volRevista.getText();
			ano = anoLancamento.getText();
			
			if(org.equals("") || titulo.equals("") || nro.equals("") || vol.equals("") || ano.equals("")) {
				throw new Exception("Ainda ha campos vazios1");
			}else {
				Revista revista = new Revista(org, Integer.parseInt(vol), Integer.parseInt(nro), titulo, Integer.parseInt(ano));
				Revista.addRevista(revista);
				JOptionPane.showMessageDialog(null, "Revista criada!", "", JOptionPane.INFORMATION_MESSAGE);
			}
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null, "Nao foi possivel cadastrar sua revista\n" + e, "Cliente Error", JOptionPane.ERROR_MESSAGE);
		}
	}

}
