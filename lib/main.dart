import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Contatos',
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                'https://scontent.fthe4-1.fna.fbcdn.net/v/t39.30808-6/326710180_704357367815094_2304038071901586324_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=RxTdHUN70nYAX-NlNks&_nc_ht=scontent.fthe4-1.fna&oh=00_AfD-wmx3OxA80-3W2UmtbkvWoY1mXD9nEPlZx_oQCVWxtQ&oe=657EE3AF',
              ),
            ),
            const SizedBox(height: 90),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
              ),
              controller: _passwordController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de Contatos'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                  'https://scontent.fthe4-1.fna.fbcdn.net/v/t39.30808-6/326710180_704357367815094_2304038071901586324_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=RxTdHUN70nYAX-NlNks&_nc_ht=scontent.fthe4-1.fna&oh=00_AfD-wmx3OxA80-3W2UmtbkvWoY1mXD9nEPlZx_oQCVWxtQ&oe=657EE3AF',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Contatos(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      onPrimary: Colors.white,
                      minimumSize: const Size(150, 150),
                    ),
                    child: const Text('Contatos'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Abastecer(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      onPrimary: Colors.white,
                      minimumSize: const Size(150, 150),
                    ),
                    child: const Text('Abastecer'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      onPrimary: Colors.white,
                      minimumSize: const Size(150, 150),
                    ),
                    child: const Text('Perfil'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      launch('https://github.com/isabellemayse');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      onPrimary: Colors.white,
                      minimumSize: const Size(150, 150),
                    ),
                    child: const Text('GitHub'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Contatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contatos cadastrados',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildInfoContato(
              nome: 'Isabelle',
              email: 'isabellemayse@outlook.com',
              matricula: '2022211MTDS0310',
              curso: 'Desenvolvimento de Sistemas - Noite',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Cadastrar Contato'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Alterar Contato'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Excluir Contato'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoContato({
    required String nome,
    required String email,
    required String matricula,
    required String curso,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nome: $nome'),
        Text('Email: $email'),
        Text('Matrícula: $matricula'),
        Text('Curso: $curso'),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/75545599?v=4',
                ),
              ),
              const SizedBox(height: 20),
              _buildInfoPerfil(
                nome: 'Isabelle Mayse de Araujo',
                email: 'isabellemayse@outlook.com',
                matricula: '2022211MTDS0310',
                curso: 'Desenvolvimento de Sistemas - Noite',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoPerfil({
    required String nome,
    required String email,
    required String matricula,
    required String curso,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Nome: $nome'),
        Text('Email: $email'),
        Text('Matrícula: $matricula'),
        Text('Curso: $curso'),
      ],
    );
  }
}

class Abastecer extends StatefulWidget {
  const Abastecer({Key? key}) : super(key: key);

  @override
  _AbastecerState createState() => _AbastecerState();
}
class _AbastecerState extends State<Abastecer> {
  final TextEditingController _textEditingControllerGasolina =
      TextEditingController();
  final TextEditingController _textEditingControllerAlcool =
      TextEditingController();

  var resultado = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gasolina x Álcool'),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: Text(
                  'Gasolina x Álcool',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                  ),
                ),
              ),
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/6395/6395463.png',
                width: 100,
                height: 100,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Valor da Gasolina',
                ),
                controller: _textEditingControllerGasolina,
                onSubmitted: (String valor) {
                  print('Valor ' + _textEditingControllerGasolina.text);
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Valor do Álcool',
                ),
                controller: _textEditingControllerAlcool,
                onSubmitted: (String valor) {
                  print('Valor ' + _textEditingControllerAlcool.text);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    resultado = (double.parse(_textEditingControllerAlcool.text) /
                            double.parse(_textEditingControllerGasolina.text) *
                            100);
                    print('Calcular ' + resultado.toString());
                  });
                },
                child: const Text('Calcular'),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text('Resultado: ' + resultado.toStringAsFixed(2)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  resultado > 70
                      ? 'Abasteça com Álcool'
                      : 'Abasteça com Gasolina',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



